class Tag < ApplicationRecord
	has_many :taggings
	has_many :influencers, through: :taggings
end
