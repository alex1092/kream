class DropFNameFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :f_name
    remove_column :users, :l_name
  end
end
