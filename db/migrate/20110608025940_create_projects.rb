class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.references :app_type, :null => false
      t.references :company
      t.string :name, :null => false
      t.string :identifier, :null => false
      t.integer :releases_count, :default => 0
      t.string :site
      t.string :picture_file_name
      t.string :picture_content_type
      t.integer :picture_file_size
      t.datetime :picture_updated_at
      t.text :description, :null => false
      t.timestamps
    end
    
    add_index :projects, :name
    add_index :projects, :identifier, :unique => true
    
    execute 'ALTER TABLE projects ADD CONSTRAINT fk_projects_app_types FOREIGN KEY (app_type_id) REFERENCES app_types(id)'
    execute 'ALTER TABLE projects ADD CONSTRAINT fk_projects_companies FOREIGN KEY (company_id) REFERENCES companies(id)'
  end

  def self.down
    drop_table :projects
  end
end
