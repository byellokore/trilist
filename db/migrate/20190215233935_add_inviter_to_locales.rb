class AddInviterToLocales < ActiveRecord::Migration[5.2]
  def change
    add_reference :locales, :inviter, foreign_key: true
  end
end
