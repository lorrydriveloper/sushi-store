class Category < ApplicationRecord
  has_many :items, dependent: :delete_all
end
