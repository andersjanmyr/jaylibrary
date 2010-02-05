class Loan < ActiveRecord::Base
  belongs_to :book_copy
  belongs_to :user
end
