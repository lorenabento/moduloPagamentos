class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.references :contact
      t.references :system_role
      t.integer :system_idiom_id, :null => false
      t.integer :status_id, :null => false
      t.references :company
      t.string :username, :null => false
      t.string :email, :null => false
      t.string :password_hash
      t.string :password_salt
      t.string :auth_token, :null => false
      t.string :password_reset_token
      t.datetime :password_reset_sent_at
      t.datetime :last_login_at
      t.timestamps
    end
    
    add_index :users, :username
    add_index :users, :email
    add_index :users, :auth_token, :unique => true
    add_index :users, :password_reset_token, :unique => true
    
    execute "ALTER TABLE users ADD CONSTRAINT fk_users_contacts FOREIGN KEY (contact_id) REFERENCES contacts(id)"
    execute "ALTER TABLE users ADD CONSTRAINT fk_users_system_roles FOREIGN KEY (system_role_id) REFERENCES system_roles(id)"
    execute "ALTER TABLE users ADD CONSTRAINT fk_users_statuses FOREIGN KEY (status_id) REFERENCES user_statuses(id)"
    execute "ALTER TABLE users ADD CONSTRAINT fk_users_companies FOREIGN KEY (company_id) REFERENCES companies(id)"
    execute "ALTER TABLE users ADD CONSTRAINT fk_users_idioms FOREIGN KEY (system_idiom_id) REFERENCES idioms(id)"
  end

  def self.down
    drop_table :users
  end
end
