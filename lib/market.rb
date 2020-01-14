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
end
