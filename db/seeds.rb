# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

zen = Book.create({:title => 'Zen and the Art of Motorcycle Maintenance', :author => 'Robert Pirsig', :isbn => '0688002307'})
time = Book.create({:title => 'Time Management for System Administrators', :author => 'Thomas A. Limoncelli ', :isbn => '0596007833'})
godel = Book.create({:title => 'Gödel, Escher, Bach', :author => 'Douglas R. Hofstadter', :isbn => '0465026567'})

malmo = Library.create({:name => 'Malmö'})
denmark = Library.create({:name => 'Denmark'})
helsingborg = Library.create({:name => 'Helsingborg'})

zen_copy1 = BookCopy.create({:book => zen, :library => malmo})
zen_copy2 = BookCopy.create({:book => zen, :library => malmo})
zen_copy3 = BookCopy.create({:book => zen, :library => helsingborg})
time_copy1 = BookCopy.create({:book => time, :library => denmark})
time_copy2 = BookCopy.create({:book => time, :library => malmo})

anders = User.create({:login => 'andersjanmyr', :name => 'Anders Janmyr'})
tobias = User.create({:login => 'tobiassodergren', :name => 'Tobias Södergren'})

Loan.create({:book_copy => zen_copy1, :user => anders})
Loan.create({:book_copy => time_copy1, :user => anders})
Loan.create({:book_copy => time_copy2, :user => tobias})
