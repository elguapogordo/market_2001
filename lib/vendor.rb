class Vendor

  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new { |hash, key| hash[key] = 0 }
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, qty)
    @inventory[item] += qty
  end

  def potential_revenue
    inventory.sum { |item, qty| item.price[1..-1].to_f * qty }
  end

end
