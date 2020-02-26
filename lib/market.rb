class Market

  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
    @market_inventory = Hash.new do |hash, key|
      hash[key] = Hash.new { |hash, key| hash[key] = 0 }
    end
  end

  def add_vendor(vendor)
    vendors << vendor
  end

  def vendor_names
    vendors.map { |vendor| vendor.name }
  end

  def vendors_that_sell(item)
    vendors.find_all { |vendor| vendor.inventory.include?(item) }
  end

  def sorted_items_list
    total_inventory
    @market_inventory.find_all do |item, hash|

    require 'pry'; binding.pry
    end
  end

  def total_inventory
    vendors.each do |vendor|
      vendor.inventory.each do |item, qty|
        @market_inventory[item][:quantity] += qty
        @market_inventory[item][:vendors] = vendors_that_sell(item)
      end
    end
    @market_inventory
  end

end
