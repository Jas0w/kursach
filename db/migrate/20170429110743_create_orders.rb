class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :tariff, index: true, foreign_key: true
      t.references :car, index: true, foreign_key: true
      t.date :date_of_order, 		null: false
      t.time :time_of_order,		null: false
      t.string :departure_address,	null: false
      t.string :end_address,		null: false
      t.integer :passengers,		null: false
      t.float :distance,		null: false

      t.timestamps null: false
    end
  end
end
