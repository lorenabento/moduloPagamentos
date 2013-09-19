class AddUserIdToFeatures < ActiveRecord::Migration
  def self.up
    add_column :features, :user_id, :integer, :after => :project_id

    execute 'ALTER TABLE features ADD CONSTRAINT fk_features_users FOREIGN KEY (user_id) REFERENCES users(id)'
  end

  def self.down
    remove_column :features, :user_id
  end
end
