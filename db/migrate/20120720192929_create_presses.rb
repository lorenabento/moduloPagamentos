class CreatePresses < ActiveRecord::Migration
  def self.up
    create_table :presses do |t|
      t.string :name
      t.text :content
      t.string :image
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :presses
  end
end
