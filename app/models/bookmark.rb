class Bookmark < ApplicationRecord
  # アソシエーション設定
  belongs_to :user
  belongs_to :library

  #バリデーション設定
  validates :user_id, uniqueness: { scope: :library_id}

end
