require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'
require './lib/pantry'

class PantryTest <MiniTest::Test
  def test_it_exists
    pantry = Pantry.new
    assert_instance_of Pantry, pantry
  end
  def test_stock_is_empty_at_init
    pantry = Pantry.new
    assert_equal ({}), pantry.stock
  end
  def test_stock_of_item_can_be_checked
    pantry = Pantry.new
    cheese = Ingredient.new("Cheese", "C", 50)
    assert_equal 0, pantry.stock_check(cheese)
  end
  def test_ingredients_can_be_stocked
    pantry = Pantry.new
    cheese = Ingredient.new("Cheese", "C", 50)
    mac = Ingredient.new("Macaroni", "oz", 200)
    pantry.restock(cheese, 5)
    pantry.restock(cheese, 10)
    assert_equal 15, pantry.stock_check(cheese)
  end
  def test_it_can_check_if_enough_ingredients_for_recipe
    pantry = Pantry.new
    mac_and_cheese = Recipe.new("Mac and Cheese")
    cheese = Ingredient.new("Cheese", "C", 50)
    mac = Ingredient.new("Macaroni", "oz", 200)
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)
    pantry.restock(cheese, 5)
    pantry.restock(cheese, 10)
    assert_equal false, pantry.enough_ingredients_for?(mac_and_cheese)
    pantry.restock(mac, 8)
    assert_equal true, pantry.enough_ingredients_for?(mac_and_cheese)
  end
end
