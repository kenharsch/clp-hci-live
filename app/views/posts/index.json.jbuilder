json.array!(@posts) do |post|
  json.extract! post, :id, :title, :problemID, :content, :savedOn, :toGroupOn
  json.url post_url(post, format: :json)
end
