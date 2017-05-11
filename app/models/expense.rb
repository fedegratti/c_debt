class Expense < ActiveRecord::Base
  belongs_to :user
  scope :in_last_month, -> { where("created_at > ?", 1.month.ago) }
  scope :paid, ->(paid) { where(paid:paid) }

  validates :name, presence: true
  validates :amount, presence: true, numericality: true

end
