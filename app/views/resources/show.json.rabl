object@resource
attributes :id,:name, :description, :version, :created_at

child :user do
  attributes :id, :name, :email
  node(:url) { |user| user_url(user) }
end

child :project do
  attributes :name, :description, :started_at, :ended_at
  node(:url) { |resource| resource_url(resource) }
end


