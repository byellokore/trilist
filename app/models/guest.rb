class Guest < ApplicationRecord
  belongs_to :event
  has_one :partner
  validates :name, presence: true, length: { minimum: 3 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, allow_nil: true
  validates :cellphone, presence: true, length: { minimum: 11, maximum: 15 }
  #validate :cellphone_xor_email

  private

  def cellphone_xor_email
    unless email.blank? ^ cellphone.blank?
      errors.add(:base, :cellphone_or_email_validation)
    end
  end
end
