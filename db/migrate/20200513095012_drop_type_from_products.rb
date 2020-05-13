class DropTypeFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :type
    add_column :products, :class, :string
  end
end
