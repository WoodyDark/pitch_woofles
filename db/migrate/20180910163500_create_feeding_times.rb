class CreateFeedingTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :feeding_times do |t|
    	t.time :feeding_time
      t.timestamps
    end
    
    add_reference :feeding_times, :feeding
  end
end
