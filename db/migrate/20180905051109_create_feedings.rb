class CreateFeedings < ActiveRecord::Migration[5.2]
  def change
    create_table :feedings do |t|
    	t.string :email
    	t.string :feeding_time
    	t.integer :feeding_duration, :default=> 5
    	t.boolean :email_opt_out, :default => false

      t.timestamps
    end
  end
end
