class CreateIssueAttachments < ActiveRecord::Migration
  def self.up
    create_table :issue_attachments do |t|
      t.references :issue, :null => false
      t.string :comment
      t.string :attachment_file_name, :null => false
      t.string :attachment_content_type, :null => false
      t.integer :attachment_file_size, :null => false
      t.datetime :attachment_updated_at, :null => false
    end
    
    execute "ALTER TABLE issue_attachments ADD CONSTRAINT fk_issue_attachments_issues FOREIGN KEY (issue_id) REFERENCES issues(id)"
  end

  def self.down
    drop_table :issue_attachments
  end
end
