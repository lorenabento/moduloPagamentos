class AddTestSpecValueToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :test_spec_value, :decimal, :precision => 10, :scale => 2
  end

  def self.down
    remove_column :projects, :test_spec_value
  end
end
