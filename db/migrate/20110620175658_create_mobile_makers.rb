class CreateMobileMakers < ActiveRecord::Migration
  def self.up
    create_table :mobile_makers do |t|
      t.string :name, :null => false
      t.boolean :active, :default => true
      t.timestamps
    end

    add_index :mobile_makers, :name
  end

  def self.down
    drop_table :mobile_makers
  end
end
