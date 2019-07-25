class CombinePriceInLineItem < ActiveRecord::Migration[5.1]
  def up
    #replace multiple items for a single product in a cart with a single item
    LineItem.all.each do |line_item|
      line_item.price = line_item.product.price
      line_item.save!

    end
end
end
