class Debt
  field :title,   type: String
  field :amount,  type: Integer
  field :paid,    type: Boolean, default: false

  validates :amount, presence: true, numericality: true
  validates :title, presence: true
  validates :owner_id, presence: true

  scope :created_after, ->(time) { where("created_at > ?", time) }
  scope :paid, ->(paid) { where(paid:paid) }
end
