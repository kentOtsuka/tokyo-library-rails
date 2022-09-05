class Comment < ApplicationRecord
  # アソシエーション設定
  belongs_to :user
  belongs_to :library

  #バリデーション設定
  validates :body, presence: true, length: { maximum: 65_535 }

end
