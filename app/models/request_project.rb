class RequestProject < ApplicationRecord
  belongs_to :request
  belongs_to :project

  validates :project_id, :request_id, :quantity, :price, presence: true
  validates :price, :quantity, numericality: { only_integer: true }

  enum production_status: {"着手不可": 0,"制作待ち": 1,"製作中": 2,"制作完了": 3 }
end
