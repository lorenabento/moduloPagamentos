class CreateTestCaseStatusTransitions < ActiveRecord::Migration
  def self.up
    create_table :test_case_status_transitions, :id => false do |t|
      t.references :test_case_status, :null => false
      t.references :test_case_status_action, :null => false
    end

    add_index :test_case_status_transitions, [:test_case_status_id, :test_case_status_action_id], :unique => true, :name => 'index_on_test_case_status_id_test_case_status_action_id'

    execute 'ALTER TABLE test_case_status_transitions ADD CONSTRAINT fk_test_case_statuses1_test_case_status_actions FOREIGN KEY (test_case_status_id) REFERENCES test_case_statuses(id) ON DELETE CASCADE'
    execute 'ALTER TABLE test_case_status_transitions ADD CONSTRAINT fk_test_case_statuses_test_case_status_actions1 FOREIGN KEY (test_case_status_action_id) REFERENCES test_case_status_actions(id) ON DELETE CASCADE'
  end

  def self.down
    drop_table :test_case_status_transitions
  end
end
