class User
  has_secure_password

  field :name,                    type: String
  field :email,                   type: String
  field :password_digest,         type: String
  # field :encrypted_password,      type: String
  # field :reset_password_token,    type: String
  # field :reset_password_sent_at,  type: Datetime
  # field :remember_created_at,     type: Datetime
  # field :sign_in_count,           type: Integer
  # field :current_sign_in_at,      type: Datetime
  # field :last_sign_in_at,         type: Datetime
  # field :current_sign_in_ip,      type: String
  # field :last_sign_in_ip,         type: String
  field :admin,                   type: Boolean, default: false
  field :provider,                type: String
  field :uid,                     type: String
  field :image,                   type: String
  # field :settings,                type: String
  field :deleted_at,              type: Datetime

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

  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #     user.email = auth.info.email
  #     user.password = Devise.friendly_token[0,20]
  #     user.name = auth.info.name   # assuming the user model has a name
  #     user.image = auth.info.image # assuming the user model has an image
  #     # Set initial settings
  #     user.settings = {} if user.settings.nil?
  #     user.settings[:email_notification_enabled] = true
  #     user.settings[:email_notification_frecuency] = 'instantly'
  #     user.settings[:language] = 'en'
  #   end
  # end

  # def self.new_with_session(params, session)
  #   super.tap do |user|
  #     if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
  #       user.email = data["email"] if user.email.blank?
  #     elsif data = session["devise.twitter_data"] && session["devise.twitter_data"]["extra"]["raw_info"]
  #       user.email = data["email"] if user.email.blank?
  #     end
  #   end
  # end
end
