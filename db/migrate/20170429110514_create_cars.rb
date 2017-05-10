class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.references :driver, foreign_key: true
      t.string :model,		null: false		
      t.string :class_of_car,  	null: false
      t.string :car_number,	null: false
      t.string :color,		null: false
      t.string :year,		null: false

      t.index :car_number, unique: true
      t.index :driver_id, unique: true
      t.timestamps null: false
    end
    
    reversible do |dir|
      dir.up do
        execute("ALTER TABLE cars ADD CONSTRAINT class_check CHECK(class_of_car IN ('бизнесс', 'эконом'))")
      end
      dir.down do
        execute("ALTER TABLE cars DROP CONSTRAINT class_check")
      end
    end
  end
end
