class CreateCertifications < ActiveRecord::Migration
  def self.up
    create_table :certifications do |t|
      t.string :name, :null => false
      t.timestamps
    end
    
    add_index :certifications, :name    
  end

  def self.down
    drop_table :certifications
  end
end
