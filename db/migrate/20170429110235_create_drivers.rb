class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.references :car, index: true, foreign_key: true
      t.string :fn, 			null: false
      t.string :ln,			null: false
      t.string :sn			
      t.date :birthday,			null: false
      t.string :tin,			null: false
      t.string :passport_series,	null: false
      t.string :passport_number,	null: false

      t.index [:fn, :ln, :birthday, :tin, :passport_series, :passport_number], unique: true, name: :qq

      t.timestamps null: false
    end
  end
end
