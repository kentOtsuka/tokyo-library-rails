class Administration < ApplicationRecord
  has_many :libraries, dependent: :destroy
end
