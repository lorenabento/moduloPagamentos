class AddFacebookFieldsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :oauth_token, :string, :after => :auth_token
    add_column :users, :oauth_expires_at, :datetime, :after => :oauth_token
    add_column :users, :provider, :string, :after => :oauth_expires_at
    add_column :users, :uid, :string, :after => :provider
  end

  def self.down
    remove_column :users, :oauth_token
    remove_column :users, :oauth_expires_at
    remove_column :users, :provider
    remove_column :users, :uid
  end
end
