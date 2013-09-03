class Release < ActiveRecord::Base
  attr_accessible :id, :project_id, :status_id, :name, :identifier, :issues_count, :description
end
