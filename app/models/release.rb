class Release < ActiveRecord::Base
  attr_accessible :id, :project_id, :status_id, :name, :identifier, :issues_count, :budget, :vacancies, :closing_date, :site, :description, :instructions, :rules, :notifications, :auto_pause ,:auto_pause_tolerance, :pause_message, :championship, :created_at, :updated_at, :test_run_value
end
