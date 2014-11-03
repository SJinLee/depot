require 'test_helper'

class CartTest < ActiveSupport::TestCase
  fixtures :products
  # test "the truth" do
  #   assert true
  # end
  test "cart.line_items.size should 2 when two different products are added" do
  	cart = Cart.new
  	cart.save
  	cart.add_product(products(:ruby).id, products(:ruby).price).save
  	cart.add_product(products(:rails).id, products(:rails).price).save
  	assert cart.line_items.size == 2
  	assert cart.total_price == 93.25
  end

  test "cart.line_items.size should 1 when a product are added twice" do
  	cart = Cart.new
  	cart.save
  	cart.add_product(products(:ruby).id, products(:ruby).price).save
  	cart.add_product(products(:ruby).id, products(:ruby).price).save
  	assert cart.line_items.size == 1
  	assert cart.total_price == 99.00
  end
end
