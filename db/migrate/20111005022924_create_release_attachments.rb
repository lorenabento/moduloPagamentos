class CreateReleaseAttachments < ActiveRecord::Migration
  def self.up
    create_table :release_attachments do |t|
      t.references :release, :null => false
      t.string :attachment_file_name, :null => false
      t.string :attachment_content_type, :null => false
      t.integer :attachment_file_size, :null => false
      t.datetime :attachment_updated_at, :null => false
    end
    
    execute "ALTER TABLE release_attachments ADD CONSTRAINT fk_release_attachments_releases FOREIGN KEY (release_id) REFERENCES releases(id)"
  end

  def self.down
    drop_table :release_attachments
  end
end
