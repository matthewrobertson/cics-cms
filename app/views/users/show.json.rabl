object@user
attributes :id,:name

child :projects=> :managed_projects do
  attributes :id, :name, :description
  node(:url) { |project| project_url(project) }
end

child :contributions => :contrib_projects do
  attributes :id, :name, :description
  node(:url) { |project| project_url(project) }
end


