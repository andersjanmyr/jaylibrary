require 'spec_helper'

describe BookDescription do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :author => "value for author",
      :isbn => "value for isbn"
    }
  end

  it "should create a new instance given valid attributes" do
    BookDescription.create!(@valid_attributes)
  end
end
