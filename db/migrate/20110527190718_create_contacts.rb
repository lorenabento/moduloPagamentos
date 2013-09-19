class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.references :city
      t.string :street
      t.string :number
      t.string :complement
      t.string :district
      t.string :zipcode
      t.string :phone1
      t.string :phone2
      t.string :phone3
      t.string :email1
      t.string :email2
      t.string :site
      t.timestamps
    end
    
    execute "ALTER TABLE contacts ADD CONSTRAINT fk_contacts_cities FOREIGN KEY (city_id) REFERENCES cities(id)"
  end

  def self.down
    drop_table :contacts
  end
end
