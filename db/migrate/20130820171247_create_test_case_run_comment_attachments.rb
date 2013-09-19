class CreateTestCaseRunCommentAttachments < ActiveRecord::Migration
  def self.up
    create_table :test_case_run_comment_attachments do |t|
      t.references :test_case_run_comment, :null => false
      t.string :comment
      t.string :attachment_file_name, :null => false
      t.string :attachment_content_type, :null => false
      t.integer :attachment_file_size, :null => false
      t.datetime :attachment_updated_at, :null => false
    end

    execute "ALTER TABLE test_case_run_comment_attachments ADD CONSTRAINT fk_test_case_run_comment_attachments_test_case_run_comments FOREIGN KEY (test_case_run_comment_id) REFERENCES test_case_run_comments(id)"
  end

  def self.down
    drop_table :test_case_run_comment_attachments
  end
end
