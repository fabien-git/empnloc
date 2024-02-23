class Employee < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_one_attached :avatar
  belongs_to :user  # géré par as_owner ?
  has_many :reviews, dependent: :destroy

  validates :first_name, :last_name, presence: true
  validates :job_title, length: { minimum: 4 }, presence: true
  validates :description, length: { minimum: 6 }
  validates :price_per_day, numericality: { only_integer: true }, presence: true
end
