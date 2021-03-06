class CreateCountries < ActiveRecord::Migration
  def self.up
    create_table :countries do |t|
      t.string :name, :null => false
      t.timestamps
    end
    
    add_index :countries, :name
  end

  def self.down
    drop_table :countries
  end
end
