class CreateTestCaseStatusActions < ActiveRecord::Migration
  def self.up
    create_table :test_case_status_actions do |t|
      t.integer :resulting_status_id
      t.string :action
      t.string :action_key
      t.integer :position
      t.boolean :comment_required, :default => false

      t.timestamps
    end

    add_index :test_case_status_actions, :position

    execute 'ALTER TABLE test_case_status_actions ADD CONSTRAINT fk_test_case_status_actions_test_case_statuses FOREIGN KEY (resulting_status_id) REFERENCES test_case_statuses(id)'
  end

  def self.down
    drop_table :test_case_status_actions
  end
end
