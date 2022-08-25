class LibrariesService < ApplicationRecord
  belongs_to :library
  belongs_to :service

  validates :library_id, uniqueness: { scope: :service_id }
end
