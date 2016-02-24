class User < ActiveRecord::Base
  validates :country, presence: true
  validates :user_name, presence: true, length: { minimum: 4, maximum: 16 }
  validates :email, presence: true
  has_many :entries, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #devise :omniauthable, :omniauth_providers => [:facebook]
=begin
 def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.user = auth.info.user   # assuming the user model has a name
    #user.image = auth.info.image # assuming the user model has an image
  end
end

def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
=end
end
