class Vaccine < ApplicationRecord
  belongs_to :user
<<<<<<< HEAD
=======
  has_and_belongs_to_many :profiles

  scope :with_profiles, -> { includes(:profiles) } # Adicionando scope para filtrar vacinas

  has_and_belongs_to_many :profiles
  has_many :appointments, dependent: :destroy
  has_many :booked_profiles, through: :appointments, source: :profile
>>>>>>> config-devise
end
