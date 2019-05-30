class AddTicketToGuests < ActiveRecord::Migration[5.2]
  def change
    add_column :guests, :ticket, :string, null: true
  end
end
