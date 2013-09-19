class CreatePlans < ActiveRecord::Migration
  def self.up
    create_table :plans do |t|
      t.string :identifier, :null => false
      t.string :label_key, :null => false
      t.boolean :active, :default => true
      t.timestamps
    end

    add_index :plans, :identifier
  end

  def self.down
    drop_table :plans
  end
end
