class Issue < ActiveRecord::Base
attr_accessible :id 
attr_accessible :release_id
attr_accessible :author_id
attr_accessible :client_id
attr_accessible :feature_id
attr_accessible :type_id
attr_accessible :status_id
end
