class CreateJoinTableLocaleEvent < ActiveRecord::Migration[5.2]
  def change
    create_join_table :locales, :events do |t|
      # t.index [:locale_id, :event_id]
      # t.index [:event_id, :locale_id]
    end
  end
end
