require 'minitest/autorun'
require 'minitest/pride'
require './lib/vendor'
require './lib/item'

class VendorTest < Minitest::Test

  def setup
    @vendor = Vendor.new("Rocky Mountain Fresh")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
  end

  def test_it_exists
    assert_instance_of Vendor, @vendor
  end

  def test_it_has_attributes
    assert_equal "Tomato", @item2.name
    assert_equal "$0.50", @item2.price
  end

  def test_it_has_a_name
    assert_equal "Rocky Mountain Fresh", @vendor.name
  end

  def test_it_has_inventory
    assert_equal ({}), @vendor.inventory
  end

  def test_inventory_default_value_is_0
    assert_equal 0, @vendor.inventory["Bananas"]
  end

  def test_it_can_check_empty_stock_is_0
    assert_equal 0, @vendor.check_stock(@item1)
  end

  def test_it_can_stock_items
    assert_equal 0, @vendor.check_stock(@item1)
    @vendor.stock(@item1, 30)

    assert_equal 30, @vendor.check_stock(@item1)
  end

end
