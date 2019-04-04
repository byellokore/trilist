class Guest < ApplicationRecord
  belongs_to :event
  has_one :partner
end
