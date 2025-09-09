class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :email, format: Devise.email_regexp, presence: true, uniqueness: { case_sensitive: false }
  validates :name, :gender, :surname, presence: true, length: { maximum: 50 }
  validates :birth_date, presence: true
  validates :cpf, presence: true, length: { is: 11 }, uniqueness: { case_sensitive: true }, cpf: true
  validates :cellphone, presence: true, length: { minimum: 9, maximum: 12 }, uniqueness: { case_sensitive: true }, cellphone: true # Com x: invés de :x
  validates :password, password: true
end

# "^9\d{4}-?\d{4}"
