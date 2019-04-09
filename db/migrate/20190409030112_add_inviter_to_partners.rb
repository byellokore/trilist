class AddInviterToPartners < ActiveRecord::Migration[5.2]
  def change
    add_reference :partners, :inviter, foreign_key: true
  end
end
