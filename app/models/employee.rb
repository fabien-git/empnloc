class Employee < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :users, through: :appointments
  has_one_attached :avatar_image
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :job_title, presence: true
  validates :price_per_day, presence: true
  validates :avatar_image, presence: true
end
