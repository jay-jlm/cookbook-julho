class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(params.require(:recipe).permit(recipe_params))
    @recipe.save
    redirect_to @recipe
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    recipe = Recipe.find(params[:id])
    recipe.update(params.require(:recipe).permit(recipe_params))
    redirect_to @recipe
  end


  def show
    @recipe = Recipe.find(params[:id])
  end


  def recipe_params
    [:title, :recipe_type, :cuisine, :difficulty, :cook_time, :ingredients, :cook_method ]
  end
end
