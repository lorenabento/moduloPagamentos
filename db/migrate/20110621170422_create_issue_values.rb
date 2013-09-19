class CreateIssueValues < ActiveRecord::Migration
  def self.up
    create_table :issue_values do |t|
      t.references :release, :null => false
      t.references :issue_type, :null => false
      t.decimal :value, :precision => 10, :scale => 2, :null => false
      t.timestamps
    end
    
    add_index :issue_values, [:release_id, :issue_type_id], :unique => true
    
    execute "ALTER TABLE issue_values ADD CONSTRAINT fk_issue_values_releases FOREIGN KEY (release_id) REFERENCES releases(id)"
    execute "ALTER TABLE issue_values ADD CONSTRAINT fk_issue_values_issue_types FOREIGN KEY (issue_type_id) REFERENCES issue_types(id)"
  end

  def self.down
    drop_table :issue_values
  end
end
