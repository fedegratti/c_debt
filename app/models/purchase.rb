class Purchase < ActiveRecord::Base
  belongs_to :user
  has_many :debts, dependent: :destroy
end
