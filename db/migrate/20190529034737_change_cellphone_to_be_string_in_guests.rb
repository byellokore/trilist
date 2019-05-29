class ChangeCellphoneToBeStringInGuests < ActiveRecord::Migration[5.2]
  def change
    change_column :guests, :cellphone, :string
  end
end
