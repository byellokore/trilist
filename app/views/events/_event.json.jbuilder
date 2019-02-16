json.extract! event, :id, :name, :seo_url, :short_url, :will_happen, :address, :open_to_registration, :close_to_registration, :contacts, :inviter_id, :created_at, :updated_at
json.url event_url(event, format: :json)
