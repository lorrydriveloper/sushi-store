# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :item
  belongs_to :user

  def self.by_date(start_date, finish_date)
    where(created_at: start_date..finish_date)
  end

  def self.last_comments
    order('created_at desc')
  end
end
