class Request < ApplicationRecord
  belongs_to :member
  has_many :request_projects, dependent: :destroy #プロダクトid内の商品の削除

  validates :name, :telephone_number, :pay_type, presence: true

  enum pay_type: {"クレジットカード": 0,"銀行振込": 1}
  enum status: {"入金待ち": 0,"入金確認": 1,"制作中": 2,"発送準備中": 3,"発送済み": 4}
end
