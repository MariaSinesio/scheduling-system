class Vaccine < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :profiles
  has_and_belongs_to_many :vaccines

  scope :with_profiles, -> { includes(:profiles) } # Adicionando scope para filtrar vacinas

  has_and_belongs_to_many :profiles
  has_many :appointments, dependent: :destroy
  has_many :booked_profiles, through: :appointments, source: :profile
end
