class CreateOsVersions < ActiveRecord::Migration
  def self.up
    create_table :os_versions do |t|
      t.references :operating_system, :null => false
      t.string :name, :null => false
      t.boolean :active, :default => true
      t.timestamps
    end
    
    add_index :os_versions, [:operating_system_id, :name]
    
    execute "ALTER TABLE os_versions ADD CONSTRAINT fk_os_versions_operating_systems FOREIGN KEY (operating_system_id) REFERENCES operating_systems(id)"
  end

  def self.down
    drop_table :os_versions
  end
end
