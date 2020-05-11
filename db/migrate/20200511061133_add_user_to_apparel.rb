class AddUserToApparel < ActiveRecord::Migration[6.0]
  def change
    add_reference :apparels, :user, null: false, foreign_key: true
  end
end
