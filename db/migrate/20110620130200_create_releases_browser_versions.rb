class CreateReleasesBrowserVersions < ActiveRecord::Migration
  def self.up
    create_table :releases_browser_versions, :id => false do |t|
      t.references :release, :null => false
      t.references :browser_version, :null => false
    end
    
    add_index :releases_browser_versions, [:release_id, :browser_version_id], :unique => true, :name => "index_on_release_id_browser_version_id"
    
    execute "ALTER TABLE releases_browser_versions ADD CONSTRAINT fk_releases1_browser_versions FOREIGN KEY (release_id) REFERENCES releases(id) ON DELETE CASCADE"
    execute "ALTER TABLE releases_browser_versions ADD CONSTRAINT fk_releases_browser_versions1 FOREIGN KEY (browser_version_id) REFERENCES browser_versions(id) ON DELETE CASCADE"
  end

  def self.down
    drop_table :releases_browser_versions    
  end
end
