json.array!(@projects) do |project|
  json.id "#{project.id}"
  json.title "#{project.name}"
  json.start project.expired_at
  json.end project.expired_at
  json.url public_project_url(project)
end