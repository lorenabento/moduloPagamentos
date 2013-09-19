class CreateStates < ActiveRecord::Migration
  def self.up
    create_table :states do |t|
      t.references :country, :null => false
      t.string :name, :null => false
      t.string :acronym, :null => false
      t.timestamps
    end
    
    add_index :states, :name
    add_index :states, :acronym

    execute "ALTER TABLE states ADD CONSTRAINT fk_states_countries FOREIGN KEY (country_id) REFERENCES countries(id)"
  end

  def self.down
    drop_table :states
  end
end
