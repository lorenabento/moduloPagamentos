class AddClientValueToIssueTypes < ActiveRecord::Migration
  def self.up
    add_column :issue_types, :client_value, :decimal, :precision => 10, :scale => 2, :null => false, :after => :value
  end

  def self.down
    remove_column :issue_types, :client_value
  end
end
