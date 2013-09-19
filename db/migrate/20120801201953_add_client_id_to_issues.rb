class AddClientIdToIssues < ActiveRecord::Migration
  def self.up
    add_column :issues, :client_id, :integer, :after => :validator_id
  end

  def self.down
    remove_column :issues, :client_id
  end
end
