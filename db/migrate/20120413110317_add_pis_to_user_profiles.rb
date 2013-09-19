class AddPisToUserProfiles < ActiveRecord::Migration
  def self.up
    add_column :user_profiles, :pis, :string, :after => :moip_user
  end

  def self.down
    remove_column :user_profiles, :pis
  end
end
