require 'spec_helper'

describe Loan do

  it "should create a new instance given valid attributes" do
    Factory.create(:loan)
  end
end
