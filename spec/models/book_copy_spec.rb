require 'spec_helper'

describe BookCopy do

  it "should create a new instance given valid attributes" do
    Factory.create(:book_copy)
  end
end
