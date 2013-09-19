class CreateReleases < ActiveRecord::Migration
  def self.up
    create_table :releases do |t|
      t.references :project, :null => false
      t.integer :status_id, :null => false
      t.string :name, :null => false
      t.string :identifier, :null => false
      t.integer :issues_count, :default => 0
      t.decimal :budget, :precision => 10, :scale => 2
      t.integer :vacancies, :default => 0
      t.datetime :closing_date
      t.string :site
      t.text :description
      t.text :rules
      t.timestamps
    end
    
    add_index :releases, [:project_id, :name]
    add_index :releases, [:project_id, :identifier], :unique => true
    
    execute "ALTER TABLE releases ADD CONSTRAINT fk_releases_projects FOREIGN KEY (project_id) REFERENCES projects(id)"
    execute "ALTER TABLE releases ADD CONSTRAINT fk_releases_status FOREIGN KEY (status_id) REFERENCES release_statuses(id)"
  end

  def self.down
    drop_table :releases
  end
end
