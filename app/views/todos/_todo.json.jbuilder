json.extract! todo, :id, :task, :due_on, :remind_at, :created_at, :updated_at
json.url todo_url(todo, format: :json)
