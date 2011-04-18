class Component < ActiveRecord::Base
  attr_accessible :name, :age, :attack, :gender, :description, :cost
  
  has_attached_file :photo,
                    :styles => {
                      :thumb => ["72x72#"],
                      :medium => ["300x300#"]
                    },
                    :default_url => '/images/default_velociraptor.png',
                    :storage => :s3,
                    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                    :path => "cs446/csci446-armada_skeleton/#{Rails.env}/:attachment/:id/:style.:extension"
                    
  belongs_to :creator, :class_name => "User"
  
  def to_s
    name
  end
end
