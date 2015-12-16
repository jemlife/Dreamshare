class User < ActiveRecord::Base
  validates :country, presence: true
  validates :user_name, presence: true, length: { minimum: 4, maximum: 16 }
  validates :email, presence: true
  has_many :entries, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
