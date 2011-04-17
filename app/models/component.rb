class Component < ActiveRecord::Base
  attr_accessible :name, :age, :attack, :gender, :description, :cost
end
