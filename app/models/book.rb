class Book < ActiveRecord::Base
  has_many :book_copies

  def image_url
    image_url_prefix = 'http://images.amazon.com/images/P'
    image_url_thumbnail_suffix = '.01.%5fSCTHUMBZZZ%5f.jpg'
    "#{image_url_prefix}/#{isbn}#{image_url_thumbnail_suffix}"
  end

  def self.search query
    self.find(:all,
              :conditions => ["title like :query or author like :query or isbn like :query",
                              { :query => "%#{query}%" }])
  end

  def to_full_json

    val = self.to_json(
            :include => {
                    :book_copies => {
                            :include => {
                                    :loan => {
                                            :only => :user_id }},
                            :only => :id }},
            :methods => :image_url,
            :only => [:title, :author, :isbn])
    val
  end
end
