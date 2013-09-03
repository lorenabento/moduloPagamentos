class User < ActiveRecord::Base
  attr_accessible :id, :status_id, :username, :email
end
