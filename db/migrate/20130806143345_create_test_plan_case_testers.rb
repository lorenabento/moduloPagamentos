class CreateTestPlanCaseTesters < ActiveRecord::Migration
  def self.up
    create_table :test_plan_case_testers do |t|
      t.integer :tester_id, :null => false
      t.references :test_plan_case, :null => false
      t.references :release, :null => false
      t.timestamps
    end

    add_index :test_plan_case_testers, [:tester_id, :test_plan_case_id, :release_id], :unique => true, :name => 'index_test_plan_case_testers_on_tester_test_plan_case_release'

    execute "ALTER TABLE test_plan_case_testers ADD CONSTRAINT fk_test_plan_case_testers_testers FOREIGN KEY (tester_id) REFERENCES users(id)"
    execute "ALTER TABLE test_plan_case_testers ADD CONSTRAINT fk_test_plan_case_testers_test_plan_cases FOREIGN KEY (test_plan_case_id) REFERENCES test_plan_cases(id)"
    execute "ALTER TABLE test_plan_case_testers ADD CONSTRAINT fk_test_plan_case_testers_releases FOREIGN KEY (release_id) REFERENCES releases(id)"
  end

  def self.down
    drop_table :test_plan_case_testers
  end
end
