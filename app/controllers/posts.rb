get '/posts' do
  @all_posts = Post.all
  erb :posts
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :post
end

get '/create_post' do
  erb :create_post
end

post '/create_post' do
  @post = Post.new(title: params[:title], body: params[:body], user_id: session[:id])
  tags = parse_tags(params[:tags])
  @post.tags << tags
  @post.save
  erb :post
end

get '/posts/:id/update' do
  @post = Post.find(params[:id])
  "You tried to update the post entitled #{@post.title}"
end

get '/posts/:id/delete' do
  @post = Post.find(params[:id]).destroy
  erb :posts
end
