class Market

  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
    @inventory_hash = Hash.new do |hash, key|
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
  end

  def total_inventory
    vendors.each do |vendor|
      vendor.inventory.each do |item, qty|
        @inventory_hash[item][:quantity] += qty
        @inventory_hash[item][:vendors] = vendors_that_sell(item)
      end
    end
    @inventory_hash
  end
  # require 'pry'; binding.pry

end
