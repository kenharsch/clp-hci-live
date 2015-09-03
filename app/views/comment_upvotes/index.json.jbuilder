json.array!(@comment_upvotes) do |comment_upvote|
  json.extract! comment_upvote, :id
  json.url comment_upvote_url(comment_upvote, format: :json)
end
