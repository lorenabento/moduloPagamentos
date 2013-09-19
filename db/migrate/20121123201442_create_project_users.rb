class CreateProjectUsers < ActiveRecord::Migration
  def self.up
    create_table :project_users do |t|
      t.references :project, :null => false
      t.references :user, :null => false
      t.integer :role_id, :null => false
      t.timestamps
    end

    add_index :project_users, [:project_id, :user_id], :unique => true

    execute "ALTER TABLE project_users ADD CONSTRAINT fk_project_users_projects FOREIGN KEY (project_id) REFERENCES projects(id)"
    execute "ALTER TABLE project_users ADD CONSTRAINT fk_project_users_users FOREIGN KEY (user_id) REFERENCES users(id)"
    execute "ALTER TABLE project_users ADD CONSTRAINT fk_project_users_project_roles FOREIGN KEY (role_id) REFERENCES project_roles(id)"
  end

  def self.down
    drop_table :project_users
  end
end
