json.extract! user, :id, :username, :email, :admin, :card_number, :created_at, :updated_at
json.url user_url(user, format: :json)
