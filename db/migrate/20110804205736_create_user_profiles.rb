class CreateUserProfiles < ActiveRecord::Migration
  def self.up
    create_table :user_profiles do |t|
      t.references :user, :null => false
      t.references :school_degree
      t.string :first_name
      t.string :last_name
      t.string :occupation
      t.string :company
      t.string :position
      t.string :moip_user
      t.string :certification
      t.date :birth_date
      t.string :gender
      t.integer :years_testing_sw
      t.integer :unit_testing
      t.integer :exploratory_testing
      t.integer :test_automation
      t.integer :performance_testing
      t.integer :usability_testing
      t.integer :test_project_management
     t.timestamps
    end
    
    add_index :user_profiles, :occupation
    add_index :user_profiles, :company
    add_index :user_profiles, :position
    add_index :user_profiles, :certification
    
    execute 'ALTER TABLE user_profiles ADD CONSTRAINT fk_user_profiles_users FOREIGN KEY (user_id) REFERENCES users(id)'
    execute 'ALTER TABLE user_profiles ADD CONSTRAINT fk_user_profiles_school_degrees FOREIGN KEY (school_degree_id) REFERENCES school_degrees(id)'
  end

  def self.down
    drop_table :user_profiles
  end
end
