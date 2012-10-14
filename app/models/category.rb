class Category < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :phones

  has_and_belongs_to_many :phones
end
