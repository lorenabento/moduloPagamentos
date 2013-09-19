class CreateProjectRoles < ActiveRecord::Migration
  def self.up
    create_table :project_roles do |t|
      t.string :identifier, :null => false
      t.string :label_key, :null => false
      t.integer :position
      t.boolean :active, :default => true
      t.timestamps
    end
  end

  def self.down
    drop_table :project_roles
  end
end
