class CreateEmails < ActiveRecord::Migration[5.2]
  def change
    create_table :emails do |t|
    	t.string :email1
    	t.string :email2
        
    	t.timestamps
    end
    
    add_reference :emails, :feeding
  end
end
