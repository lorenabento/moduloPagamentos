class CreateIssueStatuses < ActiveRecord::Migration
  def self.up
    create_table :issue_statuses do |t|
      t.string :identifier, :null => false
      t.string :label_key, :null => false
      t.integer :position
      t.timestamps
    end
    
    add_index :issue_statuses, :position
  end

  def self.down
    drop_table :issue_statuses
  end
end
