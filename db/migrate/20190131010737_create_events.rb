class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :seo_url
      t.string :short_url
      t.datetime :will_happen
      t.string :address
      t.datetime :open_to_registration
      t.datetime :close_to_registration
      t.jsonb :contacts
      t.belongs_to :inviter, foreign_key: true

      t.timestamps
    end
  end
end
