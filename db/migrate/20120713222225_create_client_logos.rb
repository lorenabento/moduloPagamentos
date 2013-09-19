class CreateClientLogos < ActiveRecord::Migration
  def self.up
    create_table :client_logos do |t|
      t.string :name
      t.string :image
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :client_logos
  end
end
