json.array!(@user_data_files) do |user_data_file|
  json.extract! user_data_file, :id, :filename
  json.url user_data_file_url(user_data_file, format: :json)
end
