class Library < ApplicationRecord
  belongs_to :administration
  has_many :bookmarks, dependent: :destroy
  has_many :libraries_services, dependent: :destroy
  # 中間テーブルを通してサービステーブルとアソシエーションを結ぶ
  has_many :services, through: :libraries_services
end
