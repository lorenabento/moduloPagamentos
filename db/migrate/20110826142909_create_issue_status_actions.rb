class CreateIssueStatusActions < ActiveRecord::Migration
  def self.up
    create_table :issue_status_actions do |t|
      t.integer :resulting_status_id
      t.string :action
      t.string :action_key
      t.integer :position
      t.timestamps
    end
    
    add_index :issue_status_actions, :position
    
    execute "ALTER TABLE issue_status_actions ADD CONSTRAINT fk_issue_status_actions_issue_statuses FOREIGN KEY (resulting_status_id) REFERENCES issue_statuses(id)"
  end

  def self.down
    drop_table :issue_status_actions
  end
end
