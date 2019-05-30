class AddTicketToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :schema, :jsonb, null: false, default: { "required": ["ingressos"], "attributes": { "ingressos": { "type": "array", default: [] } } }
    add_column :events, :ticket, :jsonb
  end
end
