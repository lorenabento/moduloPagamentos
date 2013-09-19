class CreateOperatingSystems < ActiveRecord::Migration
  def self.up
    create_table :operating_systems do |t|
      t.references :app_type, :null => false
      t.string :name, :null => false
      t.boolean :active, :default => true
      t.timestamps
    end
    
    add_index :operating_systems, [:app_type_id, :name]

    execute "ALTER TABLE operating_systems ADD CONSTRAINT fk_operating_systems_app_types FOREIGN KEY (app_type_id) REFERENCES app_types(id)"
  end

  def self.down
    drop_table :operating_systems
  end
end
