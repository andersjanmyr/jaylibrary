class CreateBookCopies < ActiveRecord::Migration
  def self.up
    create_table :book_copies do |t|
      t.integer :instances
      t.references :book

      t.timestamps
    end
  end

  def self.down
    drop_table :book_copies
  end
end
