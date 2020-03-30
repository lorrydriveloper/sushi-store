class Item < ApplicationRecord
  belongs_to :category
  has_many :order_items
  has_many :order, through: :order_items

end
