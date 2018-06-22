class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
    # (ingredient_type: 'first')
    @recipe.ingredients.build
    # (ingredient_type: 'second')
  end

  def create
    recipe = Recipe.create(recipe_params)
    redirect_to recipe_path
  end

private
  def recipe_params
    params.require(:recipe).permit(
      :title,
      ingredients_attributes: [
        :name,
        :quantity
        # ,
        # :ingredient_type
      ]
    )
  end
end
