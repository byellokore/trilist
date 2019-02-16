class CreatePartners < ActiveRecord::Migration[5.2]
  def change
    create_table :partners do |t|
      t.string :email
      t.string :name
      t.jsonb :phone_numbers
      t.string :password, null: false
      t.boolean :active, default: true
      t.timestamps
    end
  end
end
