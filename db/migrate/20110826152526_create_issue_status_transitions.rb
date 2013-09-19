class CreateIssueStatusTransitions < ActiveRecord::Migration
  def self.up
    create_table :issue_status_transitions, :id => false do |t|
      t.references :issue_status, :null => false
      t.references :issue_status_action, :null => false
    end
    
    add_index :issue_status_transitions, [:issue_status_id, :issue_status_action_id], :unique => true, :name => 'index_on_issue_status_id_issue_status_action_id'
    
    execute 'ALTER TABLE issue_status_transitions ADD CONSTRAINT fk_issue_statuses1_issue_status_actions FOREIGN KEY (issue_status_id) REFERENCES issue_statuses(id) ON DELETE CASCADE'
    execute 'ALTER TABLE issue_status_transitions ADD CONSTRAINT fk_issue_statuses_issue_status_actions1 FOREIGN KEY (issue_status_action_id) REFERENCES issue_status_actions(id) ON DELETE CASCADE'
  end

  def self.down
    drop_table :issue_status_transitions    
  end
end
