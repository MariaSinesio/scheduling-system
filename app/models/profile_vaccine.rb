class ProfileVaccine < ApplicationRecord
  belongs_to :profile
  belongs_to :vaccine
end
