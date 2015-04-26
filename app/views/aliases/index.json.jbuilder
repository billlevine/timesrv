json.array!(@aliases) do |_alias|
  json.extract! _alias, :id, :UserId
end
