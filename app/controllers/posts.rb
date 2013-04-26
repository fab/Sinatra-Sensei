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
  if @post.user.id == session[:id]
    erb :update_post
  else
    @three_posts = Post.all.sample(3)
    erb :index
  end
end

post '/posts/:id/update' do
  @post = Post.find(params[:id])
  update_values = {}
  attr_names = ['title', 'body']
  attr_names.each do |attribute|
    key = attribute.to_sym
    value = params[attribute.to_sym]
    update_values[key] = value
  end
  @post.tags.clear
  tags = parse_tags(params[:tags])
  @post.tags << tags
  puts "Update values: #{update_values}"
  puts "Params: #{params}"
  @post.update_attributes(update_values)
  erb :post
end

get '/posts/:id/delete' do
  if @post.user.id == session[:id]
    @post = Post.find(params[:id]).destroy
    @all_posts = Post.all
    erb :posts
  else
    @three_posts = Post.all.sample(3)
    erb :index
  end
end
