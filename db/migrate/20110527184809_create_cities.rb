class CreateCities < ActiveRecord::Migration
  def self.up
    create_table :cities do |t|
      t.references :state, :null => false
      t.string :name, :null => false
      t.timestamps
    end

    add_index :cities, [:state_id, :name]
    
    execute "ALTER TABLE cities ADD CONSTRAINT fk_cities_states FOREIGN KEY (state_id) REFERENCES states(id)"
  end

  def self.down
    drop_table :cities
  end
end
