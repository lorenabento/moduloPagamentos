class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.references :contact, :null => false
      t.string :name, :null => false
      t.timestamps
    end
    
    add_index :companies, :name
    
    execute "ALTER TABLE companies ADD CONSTRAINT fk_companies_contacts FOREIGN KEY (contact_id) REFERENCES contacts(id)"
  end

  def self.down
    drop_table :companies
  end
end
