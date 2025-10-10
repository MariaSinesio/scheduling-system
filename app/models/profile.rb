class Profile < ApplicationRecord
  belongs_to :user  # Um perfil pertence a apenas um usuário --- Relação de muitos para muitos
  has_many :profile_vaccines # Um usuário tem muitos perfis
  has_many :vaccines, through: :profile_vaccines

  validates :name, :relations, :gender, :birth_date, :surname, presence: true
end
