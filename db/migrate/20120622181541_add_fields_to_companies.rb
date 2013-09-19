class AddFieldsToCompanies < ActiveRecord::Migration
  def self.up
    add_column :companies, :contact_name, :string, :after => :name
    add_column :companies, :position, :string, :after => :contact_name
  end

  def self.down
    remove_column :companies, :contact_name
    remove_column :companies, :position
  end
end
