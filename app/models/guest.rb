class Guest < ApplicationRecord
  belongs_to :event
  validates :name, presence: true, length: { minimum: 3 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, allow_nil: true
  validates :cellphone, presence: true, length: { minimum: 11, maximum: 15 }
  #validate :cellphone_xor_email
  validates :surname, presence: true, length: { minimum: 3 }, allow_nil: false
  private

  def cellphone_xor_email
    unless email.blank? ^ cellphone.blank?
      errors.add(:base, :cellphone_or_email_validation)
    end
  end
end
