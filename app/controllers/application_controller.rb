class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/' do
  end


  get "/recipes" do
    @recipes = Recipe.all 
    erb :index
  end

  post "/recipes" do
    recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
  
    redirect "/recipes/#{recipe.id}"
  end

  get "/recipes/new" do
    erb :new
  end


  get "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  delete "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    @recipe.delete
  end


  get "/recipes/:id/edit" do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    @recipe.update(params[:name], params[:ingredients], params[:cook_time])
    redirect "/recipes/#{@recipe.id}"
  end
end
