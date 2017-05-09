class Friend < User
  has_many :relationships
  has_many :users, through: :relationships
end
