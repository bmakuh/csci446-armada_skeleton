class Favorite < ActiveRecord::Base
  attr_accessible :user_id, :velociraptor_id
  
  belongs_to :user
  belongs_to :velociraptor
end
