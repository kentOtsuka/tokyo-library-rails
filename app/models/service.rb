class Service < ApplicationRecord
  has_many :libraries_services, dependent: :destroy
  # 中間テーブルを通して図書館テーブルとアソシエーションを結ぶ
  has_many :libraries, through: :libraries_services, source: :library
end
