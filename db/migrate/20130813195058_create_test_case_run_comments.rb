class CreateTestCaseRunComments < ActiveRecord::Migration
  def self.up
    create_table :test_case_run_comments do |t|
      t.references :test_case_run, :null => false
      t.references :user, :null => false
      t.text :message

      t.timestamps
    end

    execute "ALTER TABLE test_case_run_comments ADD CONSTRAINT fk_test_case_run_comments_test_case_runs FOREIGN KEY (test_case_run_id) REFERENCES test_case_runs(id)"
    execute "ALTER TABLE test_case_run_comments ADD CONSTRAINT fk_test_case_run_comments_users FOREIGN KEY (user_id) REFERENCES users(id)"

  end

  def self.down
    drop_table :test_case_run_comments
  end
end
