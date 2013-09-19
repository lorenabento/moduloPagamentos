class CreateTestCaseSteps < ActiveRecord::Migration
  def self.up
    create_table :test_case_steps do |t|
      t.references :test_case
      t.integer :number
      t.string :name
      t.string :expected_result

      t.timestamps
    end

    add_index :test_case_steps, [:test_case_id, :number], :unique => true

    execute 'ALTER TABLE test_case_steps ADD CONSTRAINT fk_test_case_steps_test_cases FOREIGN KEY (test_case_id) REFERENCES test_cases(id)'
  end

  def self.down
    drop_table :test_case_steps
  end
end
