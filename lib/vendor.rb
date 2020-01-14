 class Vendor
   attr_reader :name, :inventory

   def initialize(name)
     @name = name
     @inventory = Hash.new(0)
   end

   def check_stock(item)
     @inventory[item]
   end

   def stock(item, amount)
     @inventory[item] += amount
   end

   def all_items_in_stock_names
     @inventory.keys.map do |item|
       item.name
     end
   end

 end
