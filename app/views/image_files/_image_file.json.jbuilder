json.extract! image_file, :id, :title, :file, :content, :created_at, :updated_at
json.url image_file_url(image_file, format: :json)
