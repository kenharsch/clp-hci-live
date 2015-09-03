json.array!(@real_names) do |real_name|
  json.extract! real_name, :id
  json.url real_name_url(real_name, format: :json)
end
