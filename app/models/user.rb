class User < ApplicationRecord
  validates :first_name, :last_name, presence: true
  has_one_attached :avatar
  has_many :appointments
  has_many :employees
  has_many :appointments_as_owner, through: :employees, source: :appointments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
