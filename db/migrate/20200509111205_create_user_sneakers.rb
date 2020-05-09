class CreateUserSneakers < ActiveRecord::Migration[6.0]
  def change
    create_table :user_sneakers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :sneaker, null: false, foreign_key: true

      t.timestamps
    end
  end
end
