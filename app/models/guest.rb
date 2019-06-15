class Guest < ApplicationRecord
  attr_accessor :event_will_happen
  belongs_to :event
  before_save { self.email = email.downcase }
  before_save { self.name = name.upcase }
  before_save { self.surname = surname.upcase }
  validates :name, presence: true, length: { minimum: 3 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, allow_nil: true
  validates :cellphone, presence: true, length: { minimum: 11, maximum: 15 }
  #validate :cellphone_xor_email
  validates :surname, presence: true, length: { minimum: 3 }, allow_nil: false
  validate  :over_age
  private

  def cellphone_xor_email
    unless email.blank? ^ cellphone.blank?
      errors.add(:base, :cellphone_or_email_validation)
    end
  end

  def over_age
    unless self.birthday <= 18.years.before(self.event_will_happen)
      errors.add(:base, :under_age)
    end
  end

end
