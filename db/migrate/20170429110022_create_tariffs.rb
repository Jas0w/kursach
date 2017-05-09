class CreateTariffs < ActiveRecord::Migration
  def change
    create_table :tariffs do |t|
      t.string :name, 		null: false 
      t.string :times_of_day,	null: false
      t.string :range, 		null: false
      t.string :ppk, 		null: false
       
      t.index [:name], unique: true

      t.timestamps null: false
    end

    reversible do |dir|
      dir.up do
        execute("ALTER TABLE tariffs ADD CONSTRAINT times_of_day_check CHECK(times_of_day IN ('день', 'ночь'))")
      end
      dir.down do
        execute("ALTER TABLE tariffs DROP CONSTRAINT times_of_day_check")
      end
    end

    reversible do |dir|
      dir.up do
        execute("ALTER TABLE tariffs ADD CONSTRAINT range_check CHECK(range IN ('в пределах МКАД', 'за МКАД', 'Подмосковье'))")
      end
      dir.down do
        execute("ALTER TABLE tariffs DROP CONSTRAINT range_check")
      end
    end
  end
end
