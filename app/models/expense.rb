class Expense
  field :name,    type: String
  field :amount,  type: Integer
  field :paid,    type: Boolean, default: false

  scope :in_last_month, -> { where("created_at > ?", 1.month.ago) }
  scope :paid, ->(paid) { where(paid:paid) }

  validates :name, presence: true
  validates :amount, presence: true, numericality: true

end
