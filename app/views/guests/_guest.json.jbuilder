json.extract! guest, :id, :name, :email, :cellphone, :birthday, :location, :confirmation_token, :confirmed_at, :event_id, :created_at, :updated_at
json.url guest_url(guest, format: :json)
