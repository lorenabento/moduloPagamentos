class CreateReleaseUsers < ActiveRecord::Migration
  def self.up
    create_table :release_users do |t|
      t.references :release, :null => false
      t.references :user, :null => false
      t.integer :role_id, :null => false
      t.timestamps
    end
    
    add_index :release_users, [:release_id, :user_id], :unique => true

    execute "ALTER TABLE release_users ADD CONSTRAINT fk_release_users_releases FOREIGN KEY (release_id) REFERENCES releases(id)"
    execute "ALTER TABLE release_users ADD CONSTRAINT fk_release_users_users FOREIGN KEY (user_id) REFERENCES users(id)"
    execute "ALTER TABLE release_users ADD CONSTRAINT fk_release_users_release_roles FOREIGN KEY (role_id) REFERENCES release_roles(id)"
  end

  def self.down
    drop_table :release_users
  end
end
