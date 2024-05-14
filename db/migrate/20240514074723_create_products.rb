class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description
      t.decimal :price, null: false
      t.integer :stock, null: false
      t.references :seller, null: false, foreign_key: true

      t.timestamps
    end
  end
end
