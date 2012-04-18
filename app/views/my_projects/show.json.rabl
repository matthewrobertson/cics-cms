object@project
attributes :id,:name

child :users do
  attributes :id, :name, :email
  node(:url) { |user| user_url(user) }
end

child :resources do
  attributes :name, :description, :created_at, :version
  node(:url) { |resource| resource_url(resource) }
end

child :contributions do
  attributes :id
end
