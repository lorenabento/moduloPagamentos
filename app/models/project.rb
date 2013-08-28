class Project < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :site
  attr_accessible :description
end
