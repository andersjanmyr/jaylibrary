class Book < ActiveRecord::Base
  def self.search query
    self.find(:all,
              :conditions => ["title like :query or author like :query or isbn like :query",
                              { :query => "%#{query}%" }])
  end
end
