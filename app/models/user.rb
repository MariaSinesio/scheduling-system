class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 validates :email, format: Devise.email_regexp, presence: true
 validates :name, :sex, :surname, presence: true
 validates :birth_date, presence: true
 validates :cpf, presence: true, length: { is: 11 }
end
