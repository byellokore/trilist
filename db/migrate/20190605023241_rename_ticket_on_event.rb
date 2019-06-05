class RenameTicketOnEvent < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :ticket, :preferences
  end
end
