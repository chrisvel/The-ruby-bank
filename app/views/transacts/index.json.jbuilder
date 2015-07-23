json.array!(@transacts) do |transact|
  json.extract! transact, :id, :amount, :from_user_id, :to_user_id
  json.url transact_url(transact, format: :json)
end
