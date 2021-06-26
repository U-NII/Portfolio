class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :requests, dependent: :destroy
  has_many :cart_projects
  has_many :receiveds, dependent: :destroy


  validates :last_name, :first_name,:last_name_kana,:first_name_kana, :email, :telephone_number, presence: true
  validates :telephone_number, numericality: { only_integer: true }
  validates :first_name_kana, :last_name_kana,
    format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "カタカナで入力して下さい。"}
        
        
  # is_deletedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super && (is_deleted == false)
  end
end
