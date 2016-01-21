class User < ActiveRecord::Base
	has_many :listings
	has_many :reservations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable,
           :omniauthable, :omniauth_providers => [:facebook]

	mount_uploader :avatar, AvatarUploader
	def self.from_omniauth(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
		user.email = auth.info.email
		user.password = Devise.friendly_token[0,20]
		user.avatar = auth.info.image
		end
	end

	def self.new_with_session(params, session)
		super.tap do |user|
		if data = session["devise.facebook_data"]
		data.merge!(session["devise.facebook_data"]["info"])
		data.merge!(session["devise.facebook_data"]["extra"]["raw_info"])
		user.email = data["email"] if user.email.blank?
		user.provider = data["provider"] if user.provider.blank?
		user.uid = data["uid"] if user.uid.blank?
		end
		end
	end

	def image_url
		avatar.thumb.url || avatar
	end
end
