class CreateReleasesOsVersions < ActiveRecord::Migration
  def self.up
    create_table :releases_os_versions, :id => false do |t|
      t.references :release, :null => false
      t.references :os_version, :null => false
    end
    
    add_index :releases_os_versions, [:release_id, :os_version_id], :unique => true, :name => "index_on_release_id_os_version_id"
    
    execute "ALTER TABLE releases_os_versions ADD CONSTRAINT fk_releases1_os_versions FOREIGN KEY (release_id) REFERENCES releases(id) ON DELETE CASCADE"
    execute "ALTER TABLE releases_os_versions ADD CONSTRAINT fk_releases_os_versions1 FOREIGN KEY (os_version_id) REFERENCES os_versions(id) ON DELETE CASCADE"
  end

  def self.down
    drop_table :releases_os_versions    
  end
end
