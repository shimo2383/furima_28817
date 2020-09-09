class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references   :user,                  null: false, foreign_key: true
      t.integer      :category_id,           null: false
      t.integer      :product_status_id,     null: false
      t.integer      :shipping_charges_id,   null: false
      t.integer      :shipping_region_id,    null: false
      t.integer      :shipping_date_id,      null: false
      t.string       :item,                  null: false
      t.integer      :price,                 null: false
     #t.text         :description,           null: false

     t.timestamps
    end
  end
end
