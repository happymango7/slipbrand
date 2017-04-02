class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable 

  belongs_to :plan, required: false
  validates_associated :plan

  validates :first_name, :last_name, :plan_id, :company_name, :presence => true, :if => :active?

  # Campaigns Association
  has_many :campaigns
  has_many :campaigns, dependent: :destroy

  def active?
    status == 'active'
  end

  def last_campaign(influencer)
    campaigns = influencer.campaigns
    campaign = campaigns.where(user_id: self.id).last
  end
end
 