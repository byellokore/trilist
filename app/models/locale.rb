class Locale < ApplicationRecord
  has_one :inviter
  has_and_belongs_to_many :events
  validates :inviter, presence: true
end
