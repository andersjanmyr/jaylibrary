require 'spec_helper'

describe Book do
  it "should create a new instance given valid attributes" do
    Factory.create(:book)
  end
end
