class AddAutoPauseToReleases < ActiveRecord::Migration
  def self.up
    add_column :releases, :auto_pause, :boolean, :default => false, :after => :rules
    add_column :releases, :auto_pause_tolerance, :decimal, :precision => 3, :scale => 2, :default => 0.0, :after => :auto_pause
    add_column :releases, :pause_message, :string, :after => :auto_pause_tolerance
  end

  def self.down
    remove_column :releases, :pause_message
    remove_column :releases, :auto_pause_tolerance
    remove_column :releases, :auto_pause
  end
end
