unless User.exists?
  User.create(email: "test@example.com", password: "password")
  puts "User is created"
end

unless User.find_by(email: "test@example.com").posts.exists?
  user = User.find_by(email: "test@example.com")
  Post.create(title: "twitter", url: "https://twitter.com/", user: user)
  Post.create(title: "google", url: "https://google.com/", user: user)
  Post.create(title: "CirKit", url: "https://www.cirkit.jp/", user: user)
  50.times do |t|
    Post.create(title: "example##{t}", url: "https://example.com/#{t}", user: user)
  end
  puts "Post is created"
end
