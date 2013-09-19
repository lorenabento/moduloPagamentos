class CreateUserProfilesMobileModels < ActiveRecord::Migration
  def self.up
    create_table :user_profiles_mobile_models, :id => false do |t|
      t.references :user_profile, :null => false
      t.references :mobile_model, :null => false
    end
    
    add_index :user_profiles_mobile_models, [:user_profile_id, :mobile_model_id], :unique => true, :name => "index_on_user_profile_id_mobile_model_id"
    
    execute "ALTER TABLE user_profiles_mobile_models ADD CONSTRAINT fk_user_profiles1_mobile_models FOREIGN KEY (user_profile_id) REFERENCES user_profiles(id) ON DELETE CASCADE"
    execute "ALTER TABLE user_profiles_mobile_models ADD CONSTRAINT fk_user_profiles_mobile_models1 FOREIGN KEY (mobile_model_id) REFERENCES mobile_models(id)"
  end

  def self.down
    drop_table :user_profiles_mobile_models
  end
end
