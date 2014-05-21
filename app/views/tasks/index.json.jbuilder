json.array!(@tasks) do |task|
  json.extract! task, :id, :title , :list_id ,:completed , :due
  json.url task_url(task, format: :json)
end
