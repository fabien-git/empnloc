class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :employee

  validates :renting_days, numericality: { only_integer: true }, presence: true
end
