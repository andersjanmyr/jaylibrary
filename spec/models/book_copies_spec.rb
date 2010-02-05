require 'spec_helper'

describe BookCopies do

  it "should create a new instance given valid attributes" do
    Factory.create(:book_copy)
  end
end
