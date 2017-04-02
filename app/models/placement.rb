class Placement < ApplicationRecord
  belongs_to :influencer, inverse_of: :placements
  belongs_to :campaign, inverse_of: :placements
end
