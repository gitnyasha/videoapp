json.extract! image, :id, :title, :file, :created_at, :updated_at
json.url image_url(image, format: :json)
