class AddAttendedToGuests < ActiveRecord::Migration[5.2]
  def change
    add_column :guests, :attended, :boolean, default: false
  end
end
