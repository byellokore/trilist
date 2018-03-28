json.extract! user, :id, :name, :email, :phone, :password_digest, :activation_digest, :activated, :remember_digest, :reset_digest, :reset_send_at, :created_at, :updated_at
json.url user_url(user, format: :json)
