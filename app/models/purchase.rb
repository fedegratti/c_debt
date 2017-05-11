class Purchase < ActiveRecord::Base
  belongs_to :user
  has_many :debts, dependent: :destroy
  validates :name, presence: true
  validates :amount, presence: true, numericality: true
end
