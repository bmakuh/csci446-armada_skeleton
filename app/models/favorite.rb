class Favorite < ActiveRecord::Base
  attr_accessible :user_id, :component_id
  
  belongs_to :users
  belongs_to :components
end
