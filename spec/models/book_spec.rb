require 'spec_helper'

describe Book do
  it "should create a new instance given valid attributes" do
    Factory.create(:book)
  end


  it 'should be possible to search by any field' do
    Factory.create(:book)
    Factory.create(:book, {:title => 'Ruby Duby'})
    Factory.create(:book, {:author => 'Doobie Ruby Duby'})
    books = Book.search('ruby')
    books.size.should == 2
  end
end
