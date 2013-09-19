class CreateTestCaseAttachments < ActiveRecord::Migration
  def self.up
    create_table :test_case_attachments do |t|
      t.references :test_case
      t.string :attachment_file_name
      t.string :attachment_content_type
      t.integer :attachment_file_size
      t.datetime :attachment_updated_at
    end

    execute 'ALTER TABLE test_case_attachments ADD CONSTRAINT fk_test_case_attachments_test_cases FOREIGN KEY (test_case_id) REFERENCES test_cases(id)'
  end

  def self.down
    drop_table :test_case_attachments
  end
end
