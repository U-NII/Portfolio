class Received < ApplicationRecord
  belongs_to :member
  
  validates :member_id, :name, presence: true
  validates :telephone_number, length: {is: 11}, numericality: { only_integer: true }
  
  def request_address
    [name,telephone_number].join(' ')
  end
end
