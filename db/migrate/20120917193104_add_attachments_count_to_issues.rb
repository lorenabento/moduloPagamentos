class AddAttachmentsCountToIssues < ActiveRecord::Migration
  def self.up
    add_column :issues, :attachments_count, :integer, :default => 0, :after => :additional_info
  end

  def self.down
    remove_column :issues, :attachments_count
  end
end
