class CreateIdioms < ActiveRecord::Migration
  def self.up
    create_table :idioms do |t|
      t.string :identifier, :null => false
      t.string :label_key, :null => false
      t.boolean :active, :default => true
      t.timestamps
    end
        
    add_index :idioms, :identifier    
  end

  def self.down
    drop_table :idioms
  end
end
