class CookBook
  attr_reader :recipes
  def initialize
    @recipes = []
  end
  def add_recipe(recipe)
    @recipes << recipe
  end
  def summary
    sum = []
    @recipes.each do |recipe|
      recipe_sum = {}
      recipe_sum[:name] = recipe.name
      ingredient_details = []
      recipe.ingredients_required.each do |ingredient, amount|
        info =  {}
        info[:ingredient] = ingredient.name
        info[:amount] = "#{amount} #{ingredient.unit}"
        ingredient_details << info
      end
      details = {}
      details[:ingredients] = ingredient_details
      details[:total_calories] = recipe.total_calories
      recipe_sum[:details] = details

      sum << recipe_sum
    end
    sum.sort_by do |hash|
      hash[:name]
    end.reverse
  end

end
