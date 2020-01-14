class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
      vendor.inventory.keys.find do |single_item|
        single_item == item
      end
    end
  end

  def sorted_item_list
    @vendors.flat_map do |vendor|
      vendor.all_items_in_stock_names
    end.uniq.sort
  end

  def vendor_inventory
    @vendors.map do |vendor|
      vendor.inventory
    end
  end

  def total_inventory
    all_inventory = Hash.new(0)
    vendor_inventory.each do |all_items|
      all_items.map do |item, amount|
        all_inventory[item] += amount
      end
    end

    all_inventory
  end

  def sell(item, quantity)
    total_inventory.any? do |x, amount|
      if x == item && quantity > amount
        false
      elsif x == item && quantity <= amount
        total_inventory[x] = (amount - quantity)
        true
      end
    end
  end
end
