require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'


class RecipeTest <MiniTest::Test
  def test_it_exists
    mac_and_cheese = Recipe.new("Mac and Cheese")
    assert_instance_of Recipe, mac_and_cheese
  end
  def test_it_has_init_attrs
    mac_and_cheese = Recipe.new("Mac and Cheese")
    assert_equal "Mac and Cheese", mac_and_cheese.name
    assert_equal ({}), mac_and_cheese.ingredients_required
  end
  def test_ingredients_can_be_added
    mac_and_cheese = Recipe.new("Mac and Cheese")
    cheese = Ingredient.new("Cheese", "C", 100)
    mac = Ingredient.new("Macaroni", "oz", 30)
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)
    assert_equal ({mac => 8, cheese => 2}), mac_and_cheese.ingredients_required
  end
  def text_amount_of_ingred_can_be_found_from_recipe
    mac_and_cheese = Recipe.new("Mac and Cheese")
    cheese = Ingredient.new("Cheese", "C", 100)
    mac = Ingredient.new("Macaroni", "oz", 30)
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)
    assert_equal 2, mac_and_cheese.amount_required(cheese)
    assert_equal 8, mac_and_cheese.amount_required(mac)
  end
  def test_array_of_ingred_objs_can_be_returned
    mac_and_cheese = Recipe.new("Mac and Cheese")
    cheese = Ingredient.new("Cheese", "C", 100)
    mac = Ingredient.new("Macaroni", "oz", 30)
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)
    assert_equal [cheese, mac], mac_and_cheese.ingredients
  end
  def test_it_can_find_total_calories_for_recipe
    mac_and_cheese = Recipe.new("Mac and Cheese")
    cheese = Ingredient.new("Cheese", "C", 100)
    mac = Ingredient.new("Macaroni", "oz", 30)
    mac_and_cheese.add_ingredient(cheese, 2)
    mac_and_cheese.add_ingredient(mac, 8)
    assert_equal 440, mac_and_cheese.total_calories
  end
end
