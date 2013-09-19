class CreateTestCases < ActiveRecord::Migration
  def self.up
    create_table :test_cases do |t|
      t.references :project
      t.references :feature
      t.integer :status_id
      t.integer :author_id
      t.integer :validator_id
      t.integer :client_id
      t.integer :number
      t.integer :version_number
      t.string :title
      t.text :description
      t.text :precondition
      t.decimal :estimated_time, :precision => 5, :scale => 2
      t.boolean :active, :default => true

      t.timestamps
    end

    add_index :test_cases, [:project_id, :number, :version_number], :unique => true

    execute 'ALTER TABLE test_cases ADD CONSTRAINT fk_test_cases_projects FOREIGN KEY (project_id) REFERENCES projects(id)'
    execute 'ALTER TABLE test_cases ADD CONSTRAINT fk_test_cases_features FOREIGN KEY (feature_id) REFERENCES features(id)'
    execute 'ALTER TABLE test_cases ADD CONSTRAINT fk_test_cases_statuses FOREIGN KEY (status_id) REFERENCES test_case_statuses(id)'
    execute 'ALTER TABLE test_cases ADD CONSTRAINT fk_test_cases_authors FOREIGN KEY (author_id) REFERENCES users(id)'
    execute 'ALTER TABLE test_cases ADD CONSTRAINT fk_test_cases_validators FOREIGN KEY (validator_id) REFERENCES users(id)'
    execute 'ALTER TABLE test_cases ADD CONSTRAINT fk_test_cases_clients FOREIGN KEY (client_id) REFERENCES users(id)'

  end

  def self.down
    drop_table :test_cases
  end
end
