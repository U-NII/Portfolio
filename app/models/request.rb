class Request < ApplicationRecord
  belongs_to :member
  has_many :request_projects, dependent: :destroy #プロダクトid内の商品の削除

  validates :name, length: {minimum: 1}, presence: true
  validates :telephone_number, length: {is: 11}, numericality: { only_integer: true }
  validates :pay_type, presence: true

  enum pay_type: {"クレジットカード": 0,"銀行振込": 1}
  enum buy_status: {"入金待ち": 0,"入金確認": 1,"申請準備中": 2,"申請完了": 3,}
end
