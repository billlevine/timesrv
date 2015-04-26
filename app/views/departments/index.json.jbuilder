json.array!(@departments) do |department|
  json.extract! department, :id, :manager
  json.url department_url(department, format: :json)
end
