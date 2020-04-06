class Item < ApplicationRecord
  belongs_to :category
  has_many :order_items
  has_many :orders, through: :order_items
  has_many :comments
  has_many :commentors, through: :comments, source: 'user'


end
