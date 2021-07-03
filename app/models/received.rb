class Received < ApplicationRecord
  belongs_to :member

  validates :member_id, :name, presence: true
  validates :telephone_number, length: {is: 11}, numericality: { only_integer: true }
  validate :blank_name
  validate :blank_telephone_number

  def request_address
    [name,telephone_number].join(' ')
  end

  def blank_name
    return if entrys_option == 1

    if name.blank?
      errors.add(:name, 'は入力する必要があります')
    end
  end

  def blank_telephone_number
    return if entrys_option == 2

    if telephone_number.blank?
      errors.add(:telephone_number, "は入力する必要があります")
    end
  end
end
