class CreateTestPlanCases < ActiveRecord::Migration
  def self.up
    create_table :test_plan_cases do |t|
      t.references :test_plan, :null => false
      t.references :test_case, :null => false
      t.timestamps
    end

    add_index :test_plan_cases, [:test_plan_id, :test_case_id], :unique => true

    execute "ALTER TABLE test_plan_cases ADD CONSTRAINT fk_test_plans1_test_cases FOREIGN KEY (test_plan_id) REFERENCES test_plans(id)"
    execute "ALTER TABLE test_plan_cases ADD CONSTRAINT fk_test_plans_test_cases1 FOREIGN KEY (test_case_id) REFERENCES test_cases(id)"
  end

  def self.down
    drop_table :test_plan_cases
  end
end
