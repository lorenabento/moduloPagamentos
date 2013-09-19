class AddCommentRequiredToIssueStatusActions < ActiveRecord::Migration
  def self.up
    add_column :issue_status_actions, :comment_required, :boolean, :default => false, :after => :position
  end

  def self.down
    remove_column :issue_status_actions, :comment_required
  end
end
