json.array!(@purchases) do |purchase|
  json.extract! purchase, :id, :name, :amount
  json.url purchase_url(purchase, format: :json)
end
