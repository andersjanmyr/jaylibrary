class CreateBorrowings < ActiveRecord::Migration
  def self.up
    create_table :borrowings do |t|
      t.references :book_copy
      t.references :library
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :borrowings
  end
end
