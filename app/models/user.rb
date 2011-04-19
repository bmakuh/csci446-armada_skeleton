class User < ActiveRecord::Base

  acts_as_authentic

  has_paper_trail
  
  has_many :components
  has_many :favorites
  
  belongs_to :role, :counter_cache => true
  
  validate

  default_scope :include => :role

  before_validation_on_create :assign_default_role

  def role_symbols
    [role.name.downcase.to_sym]
  end

  def deliver_password_reset_instructions!  
    reset_perishable_token!  
    UserMailer.deliver_password_reset_instructions(self)  
  end

  def is?(role_symbol)
    role_symbols.include? role_symbol
  end
  
  def is_admin?
    role_symbols.include?(:administrator) || role_symbols.include?(:developer)
  end
  
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
  
  def to_s
    self.full_name
  end
  
  protected
  
    def validate
      errors.add_to_base "User must have role." if self.role.nil?
    end

    def assign_default_role
      self.role = Role.find_by_name('member') if role.nil?
    end

end


# == Schema Information
#
# Table name: users
#
#  id                  :integer         not null, primary key
#  first_name          :string(255)     not null
#  last_name           :string(255)     not null
#  email               :string(255)     not null
#  role_id             :integer         not null
#  crypted_password    :string(255)     not null
#  password_salt       :string(255)     not null
#  persistence_token   :string(255)     not null
#  single_access_token :string(255)     not null
#  perishable_token    :string(255)     not null
#  login_count         :integer         default(0), not null
#  failed_login_count  :integer         default(0), not null
#  last_request_at     :datetime
#  current_login_at    :datetime
#  last_login_at       :datetime
#  current_login_ip    :string(255)
#  last_login_ip       :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#

