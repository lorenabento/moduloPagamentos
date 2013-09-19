class CreateSchoolDegrees < ActiveRecord::Migration
  def self.up
    create_table :school_degrees do |t|
      t.string :identifier, :null => false
      t.string :label_key, :null => false
      t.integer :position
      t.boolean :active, :default => true
      t.timestamps
    end
    
    add_index :school_degrees, :position
  end

  def self.down
    drop_table :school_degrees
  end
end
