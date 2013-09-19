class CreateMobileModels < ActiveRecord::Migration
  def self.up
    create_table :mobile_models do |t|
      t.integer :mobile_maker_id, :null => false # references estava gerando ""mobile_makers_id"
      t.string :name, :null => false
      t.boolean :active, :default => true
      t.timestamps
    end
    
    add_index :mobile_models, [:name, :mobile_maker_id]

    execute "ALTER TABLE mobile_models ADD CONSTRAINT fk_mobile_models_mobile_makers FOREIGN KEY (mobile_maker_id) REFERENCES mobile_makers(id)"
  end

  def self.down
    drop_table :mobile_models
  end
end
