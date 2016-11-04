json.array!(@events) do |event|
  json.extract! event, :id, :name, :description, :local, :participants_limit
  json.url event_url(event, format: :json)
end
