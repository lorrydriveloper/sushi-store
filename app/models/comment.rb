class Comment < ApplicationRecord
  belongs_to :item
  belongs_to :user

  def self.by_date(start_date, finish_date)
      where(created_at: start_date..finish_date)
  end
end
