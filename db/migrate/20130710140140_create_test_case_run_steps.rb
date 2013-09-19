class CreateTestCaseRunSteps < ActiveRecord::Migration
  def self.up
    create_table :test_case_run_steps do |t|
      t.references :test_case_run
      t.references :test_case_step
      t.references :status

      t.timestamps
    end
  end

  def self.down
    drop_table :test_case_run_steps
  end
end
