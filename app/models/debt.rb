class Debt
  field :title,   type: String
  field :amount,  type: Integer
  field :paid,    type: Boolean, default: false

  validates :amount, presence: true, numericality: true
  validates :title, presence: true
  validates :owner_id, presence: true

  scope :created_after, ->(time) { where("created_at > ?", time) }
  scope :paid, ->(paid) { where(paid:paid) }

  def self.user_debts(user_id)
    Debt.select{ |debt| debt.user_id == user_id && debt.paid == false }
  end

  def self.owner_debts(owner_id)
    Debt.select{ |debt| debt.owner_id == owner_id && debt.paid == false }
  end
end
