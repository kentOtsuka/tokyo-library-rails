class User < ApplicationRecord
  authenticates_with_sorcery!
  # 以下アソシエーション設定
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_libraries, through: :bookmarks, source: :library

  # 以下バリデーション
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze #変数に正規表現を代入（emailのformatで使用）
  validates :email, presence: true
  validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }, allow_blank: true #format => 指定した正規表現と一致するか調べる, allow_blanck: true => 値が空の場合はバリデーションをスキップする
  validates :password, presence: true
  validates :password, length: { in: 8..20 }, if: -> { new_record? || changes[:crypted_password] }, allow_blank: true
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
end
