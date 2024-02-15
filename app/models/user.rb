class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :appointments, dependent: :destroy
  has_many :employees, through: :appointments
  has_one_attached :avatar_image
  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true
  validates :avatar_image, presence: true
end
