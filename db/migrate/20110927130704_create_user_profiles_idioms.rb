class CreateUserProfilesIdioms < ActiveRecord::Migration
  def self.up
    create_table :user_profiles_idioms, :id => false do |t|
      t.references :user_profile, :null => false
      t.references :idiom, :null => false
    end
    
    add_index :user_profiles_idioms, [:user_profile_id, :idiom_id], :unique => true, :name => "index_on_user_profile_id_idiom_id"
    
    execute "ALTER TABLE user_profiles_idioms ADD CONSTRAINT fk_user_profiles1_idioms FOREIGN KEY (user_profile_id) REFERENCES user_profiles(id) ON DELETE CASCADE"
    execute "ALTER TABLE user_profiles_idioms ADD CONSTRAINT fk_user_profiles_idioms1 FOREIGN KEY (idiom_id) REFERENCES idioms(id)"
  end

  def self.down
    drop_table :user_profiles_idioms
  end
end