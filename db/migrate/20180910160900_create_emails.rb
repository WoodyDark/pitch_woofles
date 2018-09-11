class CreateEmails < ActiveRecord::Migration[5.2]
  def change
    create_table :emails do |t|
    	t.string :email1
    	t.string :email2
    	t.string :email3
    	t.string :email4
    	t.string :email5
    	t.timestamps
    end
    
    add_reference :emails, :feeding
  end
end
