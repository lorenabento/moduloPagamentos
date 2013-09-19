class CreateAppTypes < ActiveRecord::Migration
  def self.up
    create_table :app_types do |t|
      t.string :identifier, :null => false
      t.string :label_key, :null => false
      t.timestamps
    end
    
    add_index :app_types, :identifier
  end

  def self.down
    drop_table :app_types
  end
end
