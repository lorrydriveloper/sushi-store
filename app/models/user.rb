class User < ApplicationRecord
  has_many :orders 
  has_many :items, through: :orders
   has_many :comments
  # has_many :commented_items, through: :comments, foreing_key: 'item_id'
end
