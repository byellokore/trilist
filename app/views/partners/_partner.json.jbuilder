json.extract! partner, :id, :email, :name, :phone_numbers, :password, :active, :created_at, :updated_at
json.url partner_url(partner, format: :json)
