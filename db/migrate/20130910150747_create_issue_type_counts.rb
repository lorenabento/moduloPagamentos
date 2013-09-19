class CreateIssueTypeCounts < ActiveRecord::Migration
  def self.up
    create_table :issue_type_counts do |t|
      t.references :ranking
      t.references :issue_type
      t.integer :total_count
      t.integer :approved_count
      t.integer :reproved_count

      t.timestamps
    end
    execute 'ALTER TABLE issue_type_counts ADD CONSTRAINT fk_issue_type_counts_rankings FOREIGN KEY (ranking_id) REFERENCES rankings(id)'
  end

  def self.down
    execute 'ALTER TABLE issue_type_counts DROP CONSTRAINT fk_issue_type_counts_rankings'
    drop_table :issue_type_counts
  end
end
