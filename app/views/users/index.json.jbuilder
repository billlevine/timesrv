json.array!(@users) do |user|
  json.extract! user, :id, :department, :display_name, :manager
  json.url user_url(user, format: :json)
end
