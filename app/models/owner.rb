class Owner < ApplicationRecord
  has_many :pets, dependent: :nullify
  belongs_to :user

end
