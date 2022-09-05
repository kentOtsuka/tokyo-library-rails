class Service < ApplicationRecord
    has_many :libraries_services
    has_many :libraries, through: :libraries_services
end
