class Book < ActiveRecord::Base
  has_many :book_copies
  has_many :loans, :through => :book_copies

  def self.search query
    self.find(:all,
              :conditions => ["title like :query or author like :query or isbn like :query",
                              { :query => "%#{query}%" }])
  end

  def image_thumbnail_url
    "#{APP_CONFIG[:image_url_prefix]}/#{isbn}#{APP_CONFIG[:image_url_thumbnail_suffix]}"
  end

  def image_medium_url
    "#{APP_CONFIG[:image_url_prefix]}/#{isbn}#{APP_CONFIG[:image_url_medium_suffix]}"
  end

  def loan_count
    loans.count
  end

  def book_copy_count
    book_copies.count
  end

  def to_full_json

    val = self.to_json(
            :include => {
                    :loans => {
                            :only => :user_id }},
            :methods => [:image_thumbnail_url, :image_medium_url, :book_copy_count, :loan_count, :available ],
            :only => [:title, :author, :isbn])
    val
  end

  def self.to_full_json books
    "[#{books.map {|book| book.to_full_json }.join(',')}]"
  end
end
