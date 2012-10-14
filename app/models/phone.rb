class Phone < ActiveRecord::Base
  attr_accessible :manufacturer, :model_name, :name 
  attr_accessible :bluetooth, :gps, :wifi
  attr_accessible :gpu, :cpu, :ram 
  attr_accessible :os, :os_version 
  attr_accessible :categories

  validates :name, presence: true
  validates :manufacturer, presence: true

  has_and_belongs_to_many :categories

  def full_name
    n = "#{manufacturer} #{name}"
    n += " (#{model_name})" if model_name.present?
  end
end
