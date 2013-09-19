class CreateSystemRoles < ActiveRecord::Migration
  def self.up
    create_table :system_roles do |t|
      t.string :identifier, :null => false
      t.string :label_key, :null => false
      t.boolean :active, :default => true
      t.timestamps
    end
    
    add_index :system_roles, :identifier
  end

  def self.down
    drop_table :system_roles
  end
end
