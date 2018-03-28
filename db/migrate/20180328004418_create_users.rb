class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :password_digest
      t.string :activation_digest
      t.boolean :activated
      t.string :remember_digest
      t.string :reset_digest
      t.datetime :reset_send_at

      t.timestamps
    end
  end
end
