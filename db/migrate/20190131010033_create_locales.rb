class CreateLocales < ActiveRecord::Migration[5.2]
  def change
    create_table :locales do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :zip_code

      t.timestamps
    end
  end
end
