class ChangeUserPhoneToNotNull < ActiveRecord::Migration[6.0]
  def change
 
    change_column :users, :dob, :string, null: true
    change_column :users, :username, :string, null: true
  end
end
