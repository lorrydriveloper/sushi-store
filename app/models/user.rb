# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  before_validation :normalize_email
  validate :email_validator
  has_secure_password

  has_many :orders
  has_many :items, through: :orders
  has_many :comments
  has_many :commented_items, through: :comments, source: 'item'

  def self.find_or_create_by_auth(auth)
    find_or_create_by(email: auth['info']['email']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.avatar = auth['info']['image']
      u.password = SecureRandom.hex
    end
  end

  def email_validator
    unless EmailAddress.valid? email
      errors.add(:email, "#{email} is not a valid Email")
    end
  end

  def last_orders
    orders.order('created_at desc')
  end

  def total
    sum = 0
    orders.each { |o| sum += o.total }
    sum.round(2)
  end

  # normalize email before is pushed to DB that way all emails in DB are downcase.
  def normalize_email
    self.email = email.downcase.strip
  end

  def avatar_or_default
    avatar || 'https://robohash.org/my-own-slug.bmp?size=50x50&set=set1&bgset=bg1'
  end

  def self.by_date(start_date, finish_date)
    where(created_at: start_date..finish_date)
  end
end
