unless User.exists?
  User.create(email: "test@example.com", password: "password")
  puts "User is created"
end

unless User.find_by(email: "test@example.com").posts.exists?
  user = User.find_by(email: "test@example.com")
  posts = [
    {title: "Qiita", url: "https://qiita.com/koji-koji/items/4886dda6d287c7f2dc1b", user: user, published: true},
    {title: "Railsガイド", url: "https://railsguides.jp/", user: user, published: true},
    {title: "白雪姫", url: "https://www.netflix.com/watch/80220567?trackId=155573560", user: user, published: true},
    {title: "CirKit", url: "https://www.cirkit.jp/", user: user, published: true},
    {title: "google", url: "https://google.com/", user: user, published: false},
    {title: "twitter", url: "https://twitter.com/2002_wrr", user: user, published: false}
  ]
  Post.create(posts)

  # 20.times do |t|
  #   Post.create(title: "example##{t}", url: "https://example.com/#{t}", user: user)
  # end
  puts "Post is created"
end

# unless User.find_by(email: "test@example.com").tags.exists?
#   user = User.find_by(email: "test@example.com")
#   tags = [
#     {name: "アニメ", user: user},
#     {name: "ドラマ", user: user},
#     {name: "映画", user: user},
#     {name: "技術記事", user: user},
#     {name: "Qiita", user: user}
#   ]
#   Tag.create(tags)
#   puts "Tag is created"
# end
