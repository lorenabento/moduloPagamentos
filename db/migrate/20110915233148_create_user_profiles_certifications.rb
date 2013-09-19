class CreateUserProfilesCertifications < ActiveRecord::Migration
  def self.up
    create_table :user_profiles_certifications, :id => false do |t|
      t.references :user_profile, :null => false
      t.references :certification, :null => false
    end
    
    add_index :user_profiles_certifications, [:user_profile_id, :certification_id], :unique => true, :name => "index_on_user_profile_id_certification_id"
    
    execute "ALTER TABLE user_profiles_certifications ADD CONSTRAINT fk_user_profiles1_certifications FOREIGN KEY (user_profile_id) REFERENCES user_profiles(id) ON DELETE CASCADE"
    execute "ALTER TABLE user_profiles_certifications ADD CONSTRAINT fk_user_profiles_certifications1 FOREIGN KEY (certification_id) REFERENCES certifications(id)"
  end

  def self.down
    drop_table :user_profiles_certifications
  end
end
