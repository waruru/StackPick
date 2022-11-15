unless User.exists?(email: "test@example.com")
  User.create(email: "test@example.com", password: "password")
  puts "User is created"
end

unless Tag.exists?
  tags = [
    {id: 1, name: "アニメ"},
    {id: 2, name: "ドラマ"},
    {id: 3, name: "映画"},
    {id: 4, name: "技術記事"},
    {id: 5, name: "Qiita"}
  ]
  Tag.create(tags)
  puts "Tag is created"
end

unless User.find_by(email: "test@example.com").posts.exists?
  user = User.find_by(email: "test@example.com")
  posts = [
    {title: "Railsでのスクレイピング", url: "https://qiita.com/koji-koji/items/4886dda6d287c7f2dc1b", user: user, published: true},
    {title: "Railsガイド", url: "https://railsguides.jp/", user: user, published: true},
    {title: "白雪姫", url: "https://www.netflix.com/watch/80220567?trackId=155573560", user: user, published: true},
    {title: "CirKit ホームページ", url: "https://www.cirkit.jp/", user: user, published: true},
  ]
  Post.create(posts)
  puts "Post is created"
end
