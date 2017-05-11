class Debt < ActiveRecord::Base
  belongs_to :user
  belongs_to :owner
  belongs_to :purchase

  validates :amount, presence: true, numericality: true
  validates :title, presence: true
  validates :owner_id, presence: true

  scope :created_after, ->(time) { where("created_at > ?", time) }
  scope :paid, ->(paid) { where(paid:paid) }

end
