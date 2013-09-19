class CreateReleaseRoles < ActiveRecord::Migration
  def self.up
    create_table :release_roles do |t|
      t.string :identifier, :null => false
      t.string :label_key, :null => false
      t.integer :position
      t.boolean :active, :default => true
      t.timestamps
    end
    
    add_index :release_roles, :identifier
    add_index :release_roles, :position
  end

  def self.down
    drop_table :release_roles
  end
end
