class Book < ActiveRecord::Base
  has_many :book_copies

  def self.search query
    self.where(:conditions => ["title like :query or author like :query or isbn like :query",
                              { :query => "%#{query}%" }])
  end

  def to_full_json

    val = self.to_json(:include => {
            :book_copies => {
                    :include => {
                            :loan => {
                                    :only => :user_id }},
                    :only => :id }},
                 :only => [:title, :author, :isbn])
    val
  end
end
