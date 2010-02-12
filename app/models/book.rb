class Book < ActiveRecord::Base
  has_many :book_copies
  IMAGE_URL_PREFIX = 'http://images.amazon.com/images/P'
  IMAGE_URL_THUMBNAIL_SUFFIX = '.01._SY64_.jpg'
  IMAGE_URL_MEDIUM_SUFFIX = '.01.TZZZZZZZ.jpg'


  def self.search query
    self.find(:all,
              :conditions => ["title like :query or author like :query or isbn like :query",
                              { :query => "%#{query}%" }])
  end

  def image_thumbnail_url
    "#{IMAGE_URL_PREFIX}/#{isbn}#{IMAGE_URL_THUMBNAIL_SUFFIX}"
  end

  def image_medium_url
    "#{IMAGE_URL_PREFIX}/#{isbn}#{IMAGE_URL_MEDIUM_SUFFIX}"
  end

  def to_full_json

    val = self.to_json(
            :include => {
                    :book_copies => {
                            :include => {
                                    :loan => {
                                            :only => :user_id }},
                            :only => :id }},
            :methods => [:image_thumbnail_url, :image_medium_url],
            :only => [:title, :author, :isbn])
    val
  end
end
