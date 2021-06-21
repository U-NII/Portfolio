class RequestProject < ApplicationRecord
  belongs_to :request
  belongs_to :project

  validates :project_id, :request_id, :quantity, :price, presence: true
  validates :price, :quantity, numericality: { only_integer: true }

  enum make_status: {"参加不可": 0,"申請待ち": 1,"確認中": 2,"申請完了": 3 }
end
