class AddFNameToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :f_name, :string, null: false
    add_column :users, :l_name, :string, null: false
    add_column :users, :phone, :integer, null: false
    add_column :users, :dob, :date, null: false
  end
end
