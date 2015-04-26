json.array!(@ewos) do |ewo|
  json.extract! ewo, :id, :description, :department, :status, :EwoType
  json.url ewo_url(ewo, format: :json)
end
