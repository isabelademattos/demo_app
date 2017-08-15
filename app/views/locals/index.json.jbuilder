json.array!(@locals) do |local|
  json.extract! local, :id, :address, :number, :compl, :district, :city, :state, :zip, :user_id
  json.url local_url(local, format: :json)
end
