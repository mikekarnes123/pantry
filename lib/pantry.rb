require 'pry'
class Pantry
  attr_reader :stock
  def initialize
     @stock = {}
  end
  def stock_check(ingredient)
    return 0 if @stock[ingredient] == nil
    @stock[ingredient]
  end
  def restock(ingredient,amount)
    @stock[ingredient] = 0 if @stock[ingredient] == nil
    @stock[ingredient] += amount
  end
  def enough_ingredients_for?(recipe)
    recipe.ingredients_required.each do |ingredient, amount|
      return false if stock_check(ingredient) < amount
    end
    true
  end

end
