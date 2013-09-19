class CreateTestPlans < ActiveRecord::Migration
  def self.up
    create_table :test_plans do |t|
      t.integer :project_id
      t.integer :number
      t.string :name

      t.timestamps
    end

    add_index :test_plans, [:project_id, :name], :unique => true
  end

  def self.down
    drop_table :test_plans
  end
end
