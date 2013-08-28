class Issue < ActiveRecord::Base
attr_accessible :id 
attr_accessible :release_id
attr_accessible :author_id
attr_accessible :validator_id
attr_accessible :client_id
attr_accessible :feature_id
attr_accessible :type_id
attr_accessible :status_id
attr_accessible :os_version_id
attr_accessible :browser_version_id
attr_accessible :mobile_model_id
attr_accessible :test_case_run_id
attr_accessible :number
attr_accessible :title
attr_accessible :description
attr_accessible :action_performed
attr_accessible :expected_results
attr_accessible :additional_info
attr_accessible :attachments_count
end