class AddPartnerToGuests < ActiveRecord::Migration[5.2]
  def change
    add_reference :guests, :partner, foreign_key: true
  end
end
