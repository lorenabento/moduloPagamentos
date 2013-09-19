class CreateIssueComments < ActiveRecord::Migration
  def self.up
    create_table :issue_comments do |t|
      t.references :issue, :null => false
      t.references :user, :null => false
      t.text :message, :null => false
      t.timestamps
    end

    execute "ALTER TABLE issue_comments ADD CONSTRAINT fk_issue_comments_issues FOREIGN KEY (issue_id) REFERENCES issues(id)"
    execute "ALTER TABLE issue_comments ADD CONSTRAINT fk_issue_comments_users FOREIGN KEY (user_id) REFERENCES users(id)"
  end

  def self.down
    drop_table :issue_comments
  end
end
