def find_item_by_name_in_collection(name, collection)
  collection.each do |item_hash|
    if item_hash[:item] == name 
      return item_hash
    end
  end
  return nil
end

def consolidate_cart(cart)
  consolidated_hash = {}

  cart.each do |item_hash|
    item_name_sym = item_hash[:item].to_sym
    
    if consolidated_hash.has_key?(item_name_sym)
      consolidated_hash[item_name_sym][:count] += 1
    else
      consolidated_hash[item_name_sym] = item_hash.clone
      consolidated_hash[item_name_sym][:count] = 1
    end
  end
  
  consolidated_array = consolidated_hash.values
  # pp cart[0].object_id == consolidated_hash[:AVOCADO].object_id
  # pp cart[0].object_id == consolidated_array[0].object_id
  return consolidated_array
end


unconsolidated_cart = [
  {:item => "AVOCADO", :price => 3.00, :clearance => true },
  {:item => "AVOCADO", :price => 3.00, :clearance => true },
  {:item => "KALE", :price => 3.00, :clearance => false}
]

pp consolidate_cart(unconsolidated_cart)