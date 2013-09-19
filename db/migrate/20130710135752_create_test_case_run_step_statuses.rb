class CreateTestCaseRunStepStatuses < ActiveRecord::Migration
  def self.up
    create_table :test_case_run_step_statuses do |t|
      t.string :identifier
      t.string :label_key

      t.timestamps
    end
  end

  def self.down
    drop_table :test_case_run_step_statuses
  end
end
