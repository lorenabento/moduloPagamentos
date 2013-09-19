class CreateTestCaseStatuses < ActiveRecord::Migration
  def self.up
    create_table :test_case_statuses do |t|
      t.string :identifier
      t.string :label_key
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :test_case_statuses
  end
end
