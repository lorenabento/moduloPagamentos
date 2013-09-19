class CreateBrowserVersions < ActiveRecord::Migration
  def self.up
    create_table :browser_versions do |t|
      t.references :browser, :null => false
      t.string :name, :null => false
      t.boolean :active, :default => true
      t.timestamps
    end
    
    add_index :browser_versions, [:name, :browser_id]
    
    execute "ALTER TABLE browser_versions ADD CONSTRAINT fk_browser_versions_browsers FOREIGN KEY (browser_id) REFERENCES browsers(id)"
  end

  def self.down
    drop_table :browser_versions
  end
end
