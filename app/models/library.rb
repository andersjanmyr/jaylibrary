class Library < ActiveRecord::Base
  has_many :book_copies
end
