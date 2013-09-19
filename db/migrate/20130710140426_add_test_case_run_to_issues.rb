class AddTestCaseRunToIssues < ActiveRecord::Migration
  def self.up
    add_column :issues, :test_case_run_id, :integer, :after => 'mobile_model_id'
    add_index :issues, :test_case_run_id
    execute 'ALTER TABLE issues ADD CONSTRAINT fk_issues_test_case_runs FOREIGN KEY (test_case_run_id) REFERENCES test_case_runs(id)'
  end

  def self.down
    execute 'ALTER TABLE issues DROP FOREIGN KEY fk_issues_test_case_runs'
    remove_index :issues, :test_case_run_id
    remove_column :issues, :test_case_run_id
  end
end
