json.array!(@email_updates) do |email_update|
  json.extract! email_update, :id, :email
  json.url email_update_url(email_update, format: :json)
end
