class Recipe
  attr_reader :name,
              :ingredients_required
  def initialize(name)
    @name = name
    @ingredients_required = {}
  end
  def add_ingredient(ingredient, amount)
    @ingredients_required[ingredient] = amount
  end
  def ingredients
    ingreds = []
    @ingredients_required.each {|ingred, amount| ingreds << ingred}
    ingreds
  end
  def amount_required(ingredient)
    return "Not required" if @ingredients_required[ingredient] == nil
    @ingredients_required[ingredient]
  end
  def total_calories
    ingredients.inject(0) do |calories, ingredient|
      calories + (@ingredients_required[ingredient] * ingredient.calories)
    end
  end
end
