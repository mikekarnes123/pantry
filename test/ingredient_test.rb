require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'

class IngredientTest <MiniTest::Test
  def test_it_exists
    cheese = Ingredient.new("Cheese", "oz", 50)
    assert_instance_of Ingredient, cheese
  end
  def test_ingredient_has_attrs
    cheese = Ingredient.new("Cheese", "oz", 50)
    assert_equal "Cheese", cheese.name
    assert_equal 50, cheese.calories
    assert_equal "oz", cheese.unit
  end
end
