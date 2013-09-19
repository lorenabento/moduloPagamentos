class CreateFeatures < ActiveRecord::Migration
  def self.up
    create_table :features do |t|
      t.references :project, :null => false
      t.string :name, :null => false
      t.boolean :active, :default => true
      t.timestamps
    end
    
    add_index :features, :name
    
    execute "ALTER TABLE features ADD CONSTRAINT fk_features_projects FOREIGN KEY (project_id) REFERENCES projects(id)"
  end

  def self.down
    drop_table :features
  end
end
