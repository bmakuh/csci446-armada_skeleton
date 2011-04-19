class Favorite < ActiveRecord::Base
  attr_accessible :user_id, :component_id
  
  belongs_to :user
  belongs_to :component
end
