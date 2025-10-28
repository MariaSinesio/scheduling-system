class Profile < ApplicationRecord
  belongs_to :user  # Um perfil pertence a apenas um usuário --- Relação de muitos para muitos
  has_many :profile_vaccines # Um usuário tem muitos perfis
  has_many :vaccines, through: :profile_vaccines

  validates :name, :relation, presence: true

  has_and_belongs_to_many :vaccines

  validates :name, :relations, :gender, :birth_date, :surname, presence: true

  has_many :appointments, dependent: :destroy
  has_many :booked_vaccines, through: :appointments, source: :vaccine
end
