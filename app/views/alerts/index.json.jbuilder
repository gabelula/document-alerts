json.array!(@alerts) do |alert|
  json.extract! alert, :id, :keyword
  json.url alert_url(alert, format: :json)
end
