class CreateTestCaseComments < ActiveRecord::Migration
  def self.up
    create_table :test_case_comments do |t|
      t.references :test_case, :null => false
      t.references :user, :null => false
      t.text :message, :null => false
      t.timestamps
    end

    execute 'ALTER TABLE test_case_comments ADD CONSTRAINT fk_test_case_comments_test_cases FOREIGN KEY (test_case_id) REFERENCES test_cases(id)'
    execute 'ALTER TABLE test_case_comments ADD CONSTRAINT fk_test_case_comments_users FOREIGN KEY (user_id) REFERENCES users(id)'
  end

  def self.down
    drop_table :test_case_comments
  end
end
