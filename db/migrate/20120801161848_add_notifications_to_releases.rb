class AddNotificationsToReleases < ActiveRecord::Migration
  def self.up
    add_column :releases, :notifications, :text, :after => :rules
  end

  def self.down
    remove_column :releases, :notifications
  end
end
