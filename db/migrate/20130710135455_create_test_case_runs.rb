class CreateTestCaseRuns < ActiveRecord::Migration
  def self.up
    create_table :test_case_runs do |t|
      t.references :tester
      t.references :status
      t.references :release
      t.references :test_plan_case

      t.timestamps
    end

    add_index :test_case_runs, [:tester_id, :release_id, :test_plan_case_id], :unique => true, :name => 'index_test_case_runs_on_tester_and_release_and_test_plan_case'

  end

  def self.down
    drop_table :test_case_runs
  end
end
