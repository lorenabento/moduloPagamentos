class CreateForumTopics < ActiveRecord::Migration
  def self.up
    create_table :forum_topics do |t|
      t.references :release
      t.references :user
      t.string :title
      t.integer :messages_count, default: 0

      t.timestamps
    end

    execute 'ALTER TABLE forum_topics ADD CONSTRAINT fk_forum_topics_releases FOREIGN KEY (release_id) REFERENCES releases(id)'
    execute 'ALTER TABLE forum_topics ADD CONSTRAINT fk_forum_topics_users FOREIGN KEY (user_id) REFERENCES users(id)'
  end

  def self.down
    drop_table :forum_topics
  end
end
