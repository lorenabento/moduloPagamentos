class CreateUserProfilesOsVersions < ActiveRecord::Migration
  def self.up
    create_table :user_profiles_os_versions, :id => false do |t|
      t.references :user_profile, :null => false
      t.references :os_version, :null => false
    end
    
    add_index :user_profiles_os_versions, [:user_profile_id, :os_version_id], :unique => true, :name => "index_on_user_profile_id_os_version_id"
    
    execute "ALTER TABLE user_profiles_os_versions ADD CONSTRAINT fk_user_profiles1_os_versions FOREIGN KEY (user_profile_id) REFERENCES user_profiles(id) ON DELETE CASCADE"
    execute "ALTER TABLE user_profiles_os_versions ADD CONSTRAINT fk_user_profiles_os_versions1 FOREIGN KEY (os_version_id) REFERENCES os_versions(id)"
  end

  def self.down
    drop_table :user_profiles_os_versions
  end
end
