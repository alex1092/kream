class DropUserSneakerApparel < ActiveRecord::Migration[6.0]
  def change
    drop_table :apparels, force: :cascade
    drop_table :sneakers, force: :cascade
    drop_table :sells, force: :cascade
  end
end
