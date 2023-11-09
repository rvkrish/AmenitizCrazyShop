class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :product_code
      t.string :name
      t.float :price
      t.integer :offer_id

      t.timestamps
    end
  end
end
