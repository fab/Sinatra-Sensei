get '/' do
  puts session.inspect
  @all_posts = Post.all
  erb :index
end
