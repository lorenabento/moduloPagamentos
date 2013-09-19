class CreateBrowsers < ActiveRecord::Migration
  def self.up
    create_table :browsers do |t|
      t.string :name, :null => false
      t.boolean :active, :default => true
      t.timestamps
    end
    
    add_index :browsers, :name
  end

  def self.down
    drop_table :browsers
  end
end
