class BookCopy < ActiveRecord::Base
  belongs_to :book
  belongs_to :library
  has_one :loan

  def self.first_available(isbn)
    book = Book.find_by_isbn isbn
    copies = find_all_by_book_id(book.id)
    return nil if copies.empty?
    copies.find { |c| c.loan.nil?}
  end

  def self.all_available(isbn)
    book = Book.find_by_isbn isbn
    copies = find_all_by_book_id book.id
    copies.find_all { |c| c.loan.nil? }
  end
end
