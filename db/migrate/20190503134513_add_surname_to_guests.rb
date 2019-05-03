class AddSurnameToGuests < ActiveRecord::Migration[5.2]
  def change
    add_column :guests, :surname, :string
  end
end
