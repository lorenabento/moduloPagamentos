class CreateUserProfilesKnowledgeAreas < ActiveRecord::Migration
  def self.up
    create_table :user_profiles_knowledge_areas, :id => false do |t|
      t.references :user_profile, :null => false
      t.references :knowledge_area, :null => false
    end
    
    add_index :user_profiles_knowledge_areas, [:user_profile_id, :knowledge_area_id], :unique => true, :name => "index_on_user_profile_id_knowledge_area_id"
    
    execute "ALTER TABLE user_profiles_knowledge_areas ADD CONSTRAINT fk_user_profiles1_knowledge_areas FOREIGN KEY (user_profile_id) REFERENCES user_profiles(id) ON DELETE CASCADE"
    execute "ALTER TABLE user_profiles_knowledge_areas ADD CONSTRAINT fk_user_profiles_knowledge_areas1 FOREIGN KEY (knowledge_area_id) REFERENCES knowledge_areas(id)"
  end

  def self.down
    drop_table :user_profiles_knowledge_areas
  end
end
