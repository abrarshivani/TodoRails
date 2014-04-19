json.array!(@lists) do |list|
  json.extract! list, :id, :title
  json.url task_url(list, format: :json)
end
