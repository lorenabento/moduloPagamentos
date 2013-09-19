class CreateReleaseStatuses < ActiveRecord::Migration
  def self.up
    create_table :release_statuses do |t|
      t.string :identifier, :null => false
      t.string :label_key, :null => false
      t.timestamps
    end
    
    add_index :release_statuses, :identifier
  end

  def self.down
    drop_table :release_statuses
  end
end
