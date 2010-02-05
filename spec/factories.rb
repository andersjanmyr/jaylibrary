Factory.define :book do |b|
  b.isbn '12345678980'
  b.title 'Book Title'
  b.description 'Very good book'
  b.author 'Charlie Chaplin'
end

Factory.define :book_copy do |b|
  b.instances '1'
  b.book {|b| b.association(:book) }

end

Factory.define :library do |l|
  l.location 'Malmo'
end

Factory.define :loan do |l|
  l.book_copy {|bc| bc.association(:book_copy)}
  l.library {|l| l.association(:library)}
  l.user {|u| u.association(:user)}
end

Factory.define :user do |u|
  u.login 'login'
  u.name 'love login'
end

