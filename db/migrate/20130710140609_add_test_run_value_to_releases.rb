class AddTestRunValueToReleases < ActiveRecord::Migration
  def self.up
    add_column :releases, :test_run_value, :decimal, :precision => 10, :scale => 2
  end

  def self.down
    remove_column :releases, :test_run_value
  end
end
