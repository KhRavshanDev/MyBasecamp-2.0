json.extract! msg, :id, :title, :body, :project_id, :created_at, :updated_at
json.url msg_url(msg, format: :json)
