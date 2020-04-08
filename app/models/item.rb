class Item < ApplicationRecord
  belongs_to :category
  has_many :order_items, dependent: :delete_all
  has_many :orders, through: :order_items
  has_many :comments, dependent: :delete_all
  has_many :commentors, through: :comments, source: 'user'



  def last_comments
    comments.order('created_at DESC')
  end
end
