class Library < ApplicationRecord
  belongs_to :administration
  has_many :bookmarks, dependent: :destroy
  
  has_many :users, through: :bookmarks

end
