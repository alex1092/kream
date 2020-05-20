class DropPhoneFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :phone
  end
end
