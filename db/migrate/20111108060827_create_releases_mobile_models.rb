class CreateReleasesMobileModels < ActiveRecord::Migration
  def self.up
    create_table :releases_mobile_models, :id => false do |t|
      t.references :release, :null => false
      t.references :mobile_model, :null => false
    end
    
    add_index :releases_mobile_models, [:release_id, :mobile_model_id], :unique => true, :name => "index_on_release_id_mobile_model_id"
    
    execute "ALTER TABLE releases_mobile_models ADD CONSTRAINT fk_releases1_mobile_models FOREIGN KEY (release_id) REFERENCES releases(id) ON DELETE CASCADE"
    execute "ALTER TABLE releases_mobile_models ADD CONSTRAINT fk_releases_mobile_models1 FOREIGN KEY (mobile_model_id) REFERENCES mobile_models(id) ON DELETE CASCADE"
  end

  def self.down
    drop_table :releases_mobile_models    
  end
end
