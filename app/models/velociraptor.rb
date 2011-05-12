class Velociraptor < ActiveRecord::Base
  attr_accessible :name, :age, :attack, :gender, :description, :cost
  
  belongs_to :creator, :class_name => "User"
  
  has_many :favorites
  
  has_attached_file :photo,
                    :styles => {
                        :thumb => ["150x150#"],
                        :medium => ["300x300#"]
                      },
                      :default_url => '/images/default_velociraptor.png',
                      :storage => :s3,
                      :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                      :path => "cs446/hipsters/#{Rails.env}/:attachment/:id/:style.:extension"
                  
  
  def to_s
    self.name
  end
end
