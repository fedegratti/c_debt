class Purchase
  field :name,    type: String
  field :amount,  type: Integer
  field :paid,    type: Boolean

  validates :name, presence: true
  validates :amount, presence: true, numericality: true
end
