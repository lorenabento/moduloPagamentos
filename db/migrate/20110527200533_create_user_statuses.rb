class CreateUserStatuses < ActiveRecord::Migration
  def self.up
    create_table :user_statuses do |t|
      t.string :identifier, :null => false
      t.string :label_key, :null => false
      t.timestamps
    end
    
    add_index :user_statuses, :identifier
  end

  def self.down
    drop_table :user_statuses
  end
end
