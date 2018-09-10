class CreateFeedings < ActiveRecord::Migration[5.2]
  def change
    create_table :feedings do |t|
    	t.string :pet_name
    	t.date :pet_birthday

    	t.string :cleaning_day
    	t.time :cleaning_time

      t.boolean :notification, :default=> false
      t.boolean :automated_feeding, :default=> false

    	t.integer :feeding_duration, :default=> 5

      	t.timestamps
    end
  end
end
