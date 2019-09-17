class User
  has_secure_password

  field :name,                    type: String
  field :email,                   type: String
  field :password_digest,         type: String
  field :admin,                   type: Boolean, default: false
  field :provider,                type: String
  field :uid,                     type: String
  field :image,                   type: String
  field :deleted_at,              type: Datetime

  def settings=(arguments)
    new_setting = user_settings.find_or_create_by(key: arguments[:key])
    new_setting.value = arguments[:value]
    new_setting.save!
  end

  def settings
    user_settings.map { |setting| { setting.key => setting.value } }.reduce(:merge)
  end

  def is_deleted?
    !!deleted_at
  end

  # instead of deleting, indicate the user requested a delete & timestamp it
  def soft_delete
    update_attribute(:deleted_at, Time.current)
  end

  # ensure user account is active
  def active_for_authentication?
    super && !deleted_at
  end

  # provide a custom message for a deleted account
  def inactive_message
    !deleted_at ? super : :deleted_account
  end

  def current_friends
    friends.select { |friend| friend.deleted_at == nil }
  end

  def self.current_users
    User.select { |user| user.deleted_at == nil }
  end

  def self.notification_enabled_users(frecuency)
    User.select { |user| user.settings['email_notification_enabled'].to_b == true &&
                         user.settings['email_notification_frecuency'] == frecuency }
  end

end
