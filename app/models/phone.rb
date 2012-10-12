class Phone < ActiveRecord::Base
  attr_accessible :manufacturer, :model_name, :name 
  attr_accessible :bluetooth, :gps, :wifi
  attr_accessible :gpu, :cpu, :ram 
  attr_accessible :os, :os_version 

  validates :name, presence: true
  validates :manufacturer, presence: true

  def full_name
    n = "#{manufacturer} #{name}"
    n += " (#{model_name})" if model_name.present?
  end
end
