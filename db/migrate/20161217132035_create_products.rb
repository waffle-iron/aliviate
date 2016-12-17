class CreateProducts < ActiveRecord::Migration[5.0]
  def up
    create_table :products do |t|
      t.string  :name,        null: false
      t.text    :description, null: false
      t.decimal :price,       null: false
      t.integer :quantity
    end
  end

  def down
    drop_table :products
  end
end
