class Debt < ActiveRecord::Base
  belongs_to :user
  belongs_to :owner
  validates :amount, presence: true, numericality: true
  validates :title, presence: true
  validates :owner_id, presence: true
end
