require 'spec_helper'

describe Library do

  it "should create a new instance given valid attributes" do
    Factory.create(:library)
  end
end
