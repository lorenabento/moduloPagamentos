class AddInstructionsToReleases < ActiveRecord::Migration
  def self.up
    add_column :releases, :instructions, :text, :after => :description
  end

  def self.down
    remove_column :releases, :instructions
  end
end
