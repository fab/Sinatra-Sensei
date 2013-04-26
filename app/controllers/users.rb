get '/users' do
  @all_users = User.all
  erb :users
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :user
end
