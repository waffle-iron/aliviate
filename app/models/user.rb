class User < ApplicationRecord

  # Devise
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  # Validations

  # Methods

  def is_admin?
    return true if is_admin
  end

  def self.from_omniauth(auth)
    if where(email: auth.info.email).exists?
      user = find_by(email: auth.info.email)
      user.provider = auth.provider
      user.uid = auth.uid
      user.save
    elsif where(provider: auth.provider, uid: auth.uid).exists?
      user = find_by(provider: auth.provider, uid: auth.uid)
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.name
      user.save
    else
      user = where(provider: auth.provider, uid: auth.uid).create do |u|
        u.email = auth.info.email
        u.password = Devise.friendly_token[0,20]
        u.first_name = auth.info.name
      end
    end
    user
  end

end
