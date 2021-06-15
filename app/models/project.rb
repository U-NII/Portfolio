class Project < ApplicationRecord
    belongs_to :genre
	has_many :cart_projects
	has_many :repuests, through: :request_projects
	has_many :request_projects

	attachment :image

	validates :genre_id, :name, :price, presence: true
	validates :description, length: {maximum: 200}
	validates :price, numericality: { only_integer: true }
end
