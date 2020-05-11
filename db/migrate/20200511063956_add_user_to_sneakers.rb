class AddUserToSneakers < ActiveRecord::Migration[6.0]
  def change
    add_reference :sneakers, :user, null: false, foreign_key: true
  end
end
