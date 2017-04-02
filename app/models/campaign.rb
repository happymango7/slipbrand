class Campaign < ApplicationRecord
  belongs_to :user

  has_many :placements, dependent: :destroy
  has_many :influencers, through: :placements
  has_many :messages, dependent: :destroy

  validates :user_id, presence: true
  validates :description, presence: true
  validates :name, presence: true

end
  