class CreateSneakers < ActiveRecord::Migration[6.0]
  def change
    create_table :sneakers do |t|
      t.string :brand
      t.string :model
      t.integer :size
      t.decimal :price

      t.timestamps
    end
  end
end
