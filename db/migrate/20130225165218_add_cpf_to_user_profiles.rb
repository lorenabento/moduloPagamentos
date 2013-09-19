class AddCpfToUserProfiles < ActiveRecord::Migration
  def self.up
    add_column :user_profiles, :cpf, :string, :after => :last_name
  end

  def self.down
    remove_column :user_profiles, :cpf
  end
end
