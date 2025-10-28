class Appointment < ApplicationRecord
  belongs_to :profile
  belongs_to :vaccine

  validates :booking_token, presence: true
  validates :vaccine_id, uniqueness: { scope: :booking_token, message: "Já tem um perfil associado para esse agendamento, tente outro." }
end
