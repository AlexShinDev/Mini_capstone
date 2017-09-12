class MakeChangesToProducts < ActiveRecord::Migration[5.1]
  def change
    change_column :products, :description, :text
    change_column :products, :price, "numeric USING CAST(price AS numeric)", precision: 5, scale: 2
    add_column :products, :in_stock, :boolean
  end
end
