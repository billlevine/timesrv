json.array!(@codes) do |code|
  json.extract! code, :id, :Description
  json.url code_url(code, format: :json)
end
