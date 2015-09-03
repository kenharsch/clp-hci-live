json.array!(@post_upvotes) do |post_upvote|
  json.extract! post_upvote, :id
  json.url post_upvote_url(post_upvote, format: :json)
end
