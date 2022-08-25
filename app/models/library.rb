class Library < ApplicationRecord
  belongs_to :administration
  has_many :bookmarks, dependent: :destroy
end
