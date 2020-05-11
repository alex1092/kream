class CreateApparels < ActiveRecord::Migration[6.0]
  def change
    create_table :apparels do |t|
      t.string :brand
      t.string :model
      t.string :size
      t.decimal :price

      t.timestamps
    end
  end
end
