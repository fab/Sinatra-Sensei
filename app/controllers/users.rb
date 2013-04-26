get '/users' do
  @all_users = User.all
  erb :users
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :user
end

get '/login' do
  if session[:id]
    @all_posts = Post.all
    erb :index
  else
    erb :login
  end
end

post '/create_user' do
  @user = User.new(params)
  if @user.valid?
    @user.save
    session[:id] = @user.id
    @all_posts = Post.all
    erb :index
  else
    @error = "Fields cannot be blank. That email might already be in our database."
    erb :login
  end
end

post '/login' do
  if User.login(params)
    @user = User.find_by_email(params[:email])
    session[:id] = @user.id
    @all_posts = Post.all
    erb :index
  else
    @message = "Error, either username or password incorrect. Try again."
    erb :login
  end
end

get '/logout' do
  session.clear
  @all_posts = Post.all
  erb :index
end
