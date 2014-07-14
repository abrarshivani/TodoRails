json.array!(@tasks) do |task|
  json.extract! task, :id, :title , list_id ,completed_at,:due
end
