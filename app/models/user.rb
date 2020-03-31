# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  has_secure_password

  has_many :orders
  has_many :items, through: :orders
  has_many :comments
  # has_many :commented_items, through: :comments, foreing_key: 'item_id'
end
