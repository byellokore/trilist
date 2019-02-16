class CreateGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.string :name
      t.string :email, null: true
      t.numeric :cellphone, null: true
      t.date :birthday, null: true
      t.json :location, null: true
      t.string :confirmation_token
      t.date :confirmed_at, null: true
      t.references :event, foreign_key: true

      t.timestamps
    end
    enable_extension :pg_trgm
  end

  # An index can be created concurrently only outside of a transaction.
  disable_ddl_transaction!

  def up
    execute << SQL
    CREATE INDEX CONCURRENTLY guests_on_name_idx USING gin(name gin_trgm_ops);
    SQL
  end

  def down
    execute << SQL
    DROP INDEX guests_on_name_idx;
    SQL
  end
end
