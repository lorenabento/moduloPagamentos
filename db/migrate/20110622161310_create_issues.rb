class CreateIssues < ActiveRecord::Migration
  def self.up
    create_table :issues do |t|
      t.references :release, :null => false
      t.integer :author_id, :null => false
      t.integer :validator_id
      t.references :feature, :null => false
      t.integer :type_id, :null => false
      t.integer :status_id, :null => false
      t.references :os_version
      t.references :browser_version
      t.references :mobile_model
      t.integer :number, :null => false
      t.string :title, :null => false
      t.text :description, :null => false
      t.text :action_performed, :null => false
      t.text :expected_results, :null => false
      t.text :additional_info
      t.timestamps
    end
    
    add_index :issues, [:release_id, :number], :unique => true
    add_index :issues, [:type_id, :release_id]
    
    execute "ALTER TABLE issues ADD CONSTRAINT fk_issues_releases FOREIGN KEY (release_id) REFERENCES releases(id)"
    execute "ALTER TABLE issues ADD CONSTRAINT fk_issues_authors FOREIGN KEY (author_id) REFERENCES users(id)"
    execute "ALTER TABLE issues ADD CONSTRAINT fk_issues_validators FOREIGN KEY (validator_id) REFERENCES users(id)"
    execute "ALTER TABLE issues ADD CONSTRAINT fk_issues_features FOREIGN KEY (feature_id) REFERENCES features(id)"
    execute "ALTER TABLE issues ADD CONSTRAINT fk_issues_types FOREIGN KEY (type_id) REFERENCES issue_types(id)"
    execute "ALTER TABLE issues ADD CONSTRAINT fk_issues_statuses FOREIGN KEY (status_id) REFERENCES issue_statuses(id)"
    execute "ALTER TABLE issues ADD CONSTRAINT fk_issues_os_versions FOREIGN KEY (os_version_id) REFERENCES os_versions(id)"
    execute "ALTER TABLE issues ADD CONSTRAINT fk_issues_browser_versions FOREIGN KEY (browser_version_id) REFERENCES browser_versions(id)"
    execute "ALTER TABLE issues ADD CONSTRAINT fk_issues_mobile_models FOREIGN KEY (mobile_model_id) REFERENCES mobile_models(id)"
  end

  def self.down
    drop_table :issues
  end
end
