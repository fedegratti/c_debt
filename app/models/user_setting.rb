class UserSetting
  field :key, type: String
  field :value, type: String

  validates :key, presence: true
  validates :value, presence: true
end
