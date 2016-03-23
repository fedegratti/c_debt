json.array!(@debts) do |debt|
  json.extract! debt, :id, :title, :amount
  json.url debt_url(debt, format: :json)
end
