class AddChampionshipToReleases < ActiveRecord::Migration
  def self.up
    add_column :releases, :championship, :boolean, :default => false, :after => :pause_message
  end

  def self.down
    remove_column :releases, :championship
  end
end
