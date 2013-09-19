class CreateIssueTypes < ActiveRecord::Migration
  def self.up
    create_table :issue_types do |t|
      t.string :identifier, :null => false
      t.string :label_key, :null => false
      t.decimal :value, :precision => 10, :scale => 2, :null => false
      t.boolean :active, :default => true
      t.timestamps
    end
    
    add_index :issue_types, :value
  end

  def self.down
    drop_table :issue_types
  end
end
