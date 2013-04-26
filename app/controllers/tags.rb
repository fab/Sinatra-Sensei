get '/tags' do
  @all_tags = Tag.all
  erb :tags
end

get '/tags/:name' do
  @tag = Tag.find_by_name(params[:name])
  erb :tag
end
