class Phone < ActiveRecord::Base
  attr_accessible :manufacturer, :model_name, :name 
  attr_accessible :bluetooth, :gps, :wifi
  attr_accessible :gpu, :cpu, :ram 
  attr_accessible :os, :os_version 
  attr_accessible :price
  attr_accessible :categories

  attr_accessible :category_ids

  validates :name, presence: true
  validates :manufacturer, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  has_and_belongs_to_many :categories
  has_many :order_items

  before_destroy :check_for_orders

  def full_name
    n = "#{manufacturer} #{name}"
    n += " (#{model_name})" if model_name.present?
    n
  end

  ransacker :full_name do |parent|
     Arel::Nodes::InfixOperation.new('||',
       Arel::Nodes::InfixOperation.new('||', 
         Arel::Nodes::InfixOperation.new('||', 
           parent.table[:name], ' '),
         parent.table[:model_name]),
       parent.table[:manufacturer])
  end

  def check_for_orders
    if order_items.count > 0
      errors.add_to_base('cannot delete phone while order_items for it exists')
      return false
    end
  end
end


