class Api::RecipesController < ApplicationController
 
 def index 
  @recipes = Recipe.all 
  render 'index.json.jb'
end

def show
  @recipe = Recipe.find(params[:id])
  render 'show.json.jb'
end

def update
  @recipe = Recipe.find(params[:id])

  @recipe.title = params[:title] || @recipe.title #these are here in case the key and attribute for title is not entered 
  @recipe.chef = params[:chef] || @recipe.chef
  @recipe.ingredients = params[:ingredients] || @recipe.ingredients
  @recipe.directions = params[:directions] || @recipe.directions
  @recipe.prep_time = params[:prep_time] || @recipe.prep_time
  @recipe.image_url = params[:image_url] || @recipe.image_url

  @recipe.save
  render 'show.json.jb'

end

def create  
  @recipe = Recipe.new(
                        title: params[:title],
                        chef: params[:chef],
                        ingredients: params[:ingredients], 
                        directions: params[:directions], 
                        prep_time: params[:prep_time]
                        )
  @recipe.save #this instance variable is accessible in the show file cause we are displaying one recipe only 
  render 'show.json.jb' # we are using this cause 
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    render json: {message: "Recipe #{recipe.id} has successfully been destroyed"} #not going to view, so you can remove the @ symbol
  end





end
