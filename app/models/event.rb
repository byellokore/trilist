class Event < ApplicationRecord
  store_accessor :schema, :required, :attributes
  store_accessor :preferences, :tickets

  belongs_to :inviter
  has_many :guests
  has_one :locale
  has_one_attached :flyer
  validates_uniqueness_of :seo_url
  #after_initialize :define_default_values
  #before_validation :validate_from_schema

  private

  def define_default_values
    return unless self.ticket.blank?
    self.ticket = {}
    self.schema['attributes'].keys.each do |field|
      self.ticket[field] = self.schema['attributes'][field]['default']
    end
  end

  def define_missing_values
    difference = self.schema['attributes'].keys - self.description.keys
    difference.each do |field|
      self.ticket[field] = self.schema['attributes'][field]['default']
    end
  end

  def validate_from_schema
    self.schema['required'].each do |field|
      errors.add(field, 'is required') if self.ticket[field].blank?
    end
  end
end

