class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
	    t.string :name
	    t.string :email
	    t.string :mobile
	    t.string :company
		t.string :website
		t.timestamps null: false

		#timestamps
		#created_at , updated_at
    end
  end
end
