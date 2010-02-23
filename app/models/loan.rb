class Loan < ActiveRecord::Base
  belongs_to :book_copy
  belongs_to :user

  def self.first_by_user_id_and_isbn user_id, isbn
    loans = Loan.find_all_by_user_id(user_id)
    isbn_loans = loans.select {|l| l.book_copy.book.isbn == isbn }
    isbn_loans.empty? ? nil : isbn_loans.first
  end
end
