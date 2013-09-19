class CreateForumMessages < ActiveRecord::Migration
  def self.up
    create_table :forum_messages do |t|
      t.integer :topic_id
      t.references :user
      t.text :content

      t.timestamps
    end

    execute 'ALTER TABLE forum_messages ADD CONSTRAINT fk_forum_messages_users FOREIGN KEY (user_id) REFERENCES users(id)'
    execute 'ALTER TABLE forum_messages ADD CONSTRAINT fk_forum_messages_topics FOREIGN KEY (topic_id) REFERENCES forum_topics(id)'
  end

  def self.down
    drop_table :forum_messages
  end
end
