class InsertPriceToLineItems < ActiveRecord::Migration
  def up
    LineItem.all.each do |item|
    	item.update(price: item.product.price)
    end
  end
  
  def down
    LineItem.all.each do |item|
    	item.update(price: 0.00)
    end
  end
end
