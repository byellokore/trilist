class Event < ApplicationRecord
  belongs_to :inviter
  has_many :guests
  has_one :locale
  has_one_attached :flyer
  validates_uniqueness_of :seo_url
end
