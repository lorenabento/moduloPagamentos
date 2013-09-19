class CreateKnowledgeAreas < ActiveRecord::Migration
  def self.up
    create_table :knowledge_areas do |t|
      t.string :identifier, :null => false
      t.string :label_key, :null => false
      t.timestamps
    end
    
    add_index :knowledge_areas, :identifier   
  end

  def self.down
    drop_table :knowledge_areas
  end
end
