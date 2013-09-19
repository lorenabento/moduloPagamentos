class AddAttachmentsCountToTestCaseRunComments < ActiveRecord::Migration
  def self.up
    add_column :test_case_run_comments, :attachments_count, :integer, :default => 0, :after => :message
  end

  def self.down
    remove_column :test_case_run_comments, :attachments_count
  end
end

