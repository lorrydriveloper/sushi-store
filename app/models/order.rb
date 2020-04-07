# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :delete_all
  has_many :items, through: :order_items

  def calculate_total
    total = 0

    items.each do |item|
      total += item.price
    end

    total = total
  end

  def order_date
    created_at.strftime('%a %d %b at %H:%M')
  end
end
