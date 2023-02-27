class PersonalData < ApplicationRecord
  has_many :employments, dependent: :destroy
end