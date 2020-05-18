class RemoveClassFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :class
    add_column :products, :category, :string
  end
end
