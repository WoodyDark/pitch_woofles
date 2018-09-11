class CreateFeedingTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :feeding_times do |t|
    	t.time :feeding_time_1
    	t.time :feeding_time_2
    	t.time :feeding_time_3
    	t.time :feeding_time_4
      t.timestamps
    end
    
    add_reference :feeding_times, :feeding
  end
end
