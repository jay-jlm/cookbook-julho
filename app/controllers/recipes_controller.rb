class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(params.require(:recipe).permit(recipe_params))
    if @recipe.save(params.require(:recipe).permit(recipe_params))
      flash[:success] = "Receita criada com sucesso."
      redirect_to @recipe
    else
      flash[:error] = "Você deve informar todos os dados da receita"
      render 'new'
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(params.require(:recipe).permit(recipe_params))
      flash[:success] = "Receita editada com sucesso."
      redirect_to @recipe
    else
      flash[:error] = "Você deve informar todos os dados da receita"
      render 'edit'
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end


  def recipe_params
    [:title, :recipe_type, :cuisine, :difficulty, :cook_time, :ingredients, :cook_method ]
  end
end
