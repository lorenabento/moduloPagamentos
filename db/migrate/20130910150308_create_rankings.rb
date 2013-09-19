class CreateRankings < ActiveRecord::Migration
  def self.up
    create_table :rankings do |t|
      t.references :user
      t.integer :year
      t.integer :month

      t.timestamps
    end
    execute 'ALTER TABLE rankings ADD CONSTRAINT fk_rankings_users FOREIGN KEY (user_id) REFERENCES users(id)'
  end

  def self.down
    execute 'ALTER TABLE rankings drop CONSTRAINT fk_rankings_users'
    drop_table :rankings
  end
end
