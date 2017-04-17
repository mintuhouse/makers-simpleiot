json.extract! device, :id, :name, :secret, :data, :created_at, :updated_at
json.url device_url(device, format: :json)
