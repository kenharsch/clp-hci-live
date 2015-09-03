json.array!(@assignments) do |assignment|
  json.extract! assignment, :id, :title, :description, :draftDue, :finalDue, :toGroup, :isPosted, :toGroupOn, :postedOn
  json.url assignment_url(assignment, format: :json)
end
