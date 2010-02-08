# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

Book.create({:title => 'Zen and the Art of Motorcycle Maintenance', :author => 'Robert Pirsig', :isbn => '0688002307'})
Book.create({:title => 'Time Management for System Administrators', :author => 'Thomas A. Limoncelli ', :isbn => '0596007833'})
Book.create({:title => 'Gödel, Escher, Bach', :author => 'Douglas R. Hofstadter', :isbn => '0465026567'})
