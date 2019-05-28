json.extract! @guest, :id, :confirmed_at
json.url guest_url(@guest, format: :json)
