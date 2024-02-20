class Employee < ApplicationRecord
  has_many :appointments
  belongs_to :user  # géré par as_owner ?

  validates :first_name, :last_name, presence: true
  validates :job_title, length: { minimum: 4 }, presence: true
  validates :description, length: { minimum: 6 }
  # validates :avatar_img , presence: true
  validates :price_per_day, numericality: { only_integer: true }, presence: true
end
