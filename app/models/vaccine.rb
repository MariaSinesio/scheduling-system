class Vaccine < ApplicationRecord
  belongs_to :user

  scope :with_profiles, -> { where.not(profile_id: nil) } # Nessa parte do código, where.not(profile_id:nil) representa um filtro que relaciona as vacinas com perfis existentes
  # Scope é um filtro já definido, isso facilita a reutilização e legibilidade
end
