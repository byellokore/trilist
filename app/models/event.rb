class Event < ApplicationRecord
  belongs_to :inviter
  has_many :guests
  has_one :locale
end
