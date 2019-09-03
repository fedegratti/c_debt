class Purchase
  field :name,    type: String
  field :amount,  type: Integer
  field :paid,    type: Boolean, default: false

  validates :name, presence: true
  validates :amount, presence: true, numericality: true

  def self.user_purchases(user_id)
    Purchase.select{ |purchase| purchase.user_id == user_id && purchase.paid == false }
  end

end
