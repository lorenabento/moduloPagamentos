class AddPlanIdToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :plan_id, :integer, :after => :id
    execute 'ALTER TABLE projects ADD CONSTRAINT fk_projects_plans FOREIGN KEY (plan_id) REFERENCES plans(id)'
  end

  def self.down
    execute 'ALTER TABLE projects DROP FOREIGN KEY fk_projects_plans'
    remove_column :projects, :plan_id
  end
end
