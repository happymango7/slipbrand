class CampaignsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_plan

  def new
  	@campaign = Campaign.new
  end 

  def create
  	@campaign = current_user.campaigns.create(campaign_params)

  	if @campaign.save
  		redirect_to campaign_path(@campaign)
  	else

  	end
  end

  def edit
    @campaign = Campaign.find(params[:id])
  end

  def update
    @campaign = Campaign.find(params[:id])
    if @campaign.update_attributes(campaign_params)
      redirect_to campaign_path(@campaign)
    else
      render 'edit'
    end
  end

  def index
  	@campaigns = current_user.campaigns
  end

  def show
    @campaign = Campaign.find(params[:id])
    @influencers = @campaign.influencers
  end

  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy

    redirect_to campaigns_path
  end

  # Add influencer to a campaign // refactor this method!!
  def add_influencer
    @campaign = Campaign.find(params[:campaign_id])
    @influencer = Influencer.find(params[:influencer_id])

    array =  @campaign.influencers.map(&:id).to_a
    
    unless array.include?(@influencer.id)
      array.push(@influencer.id)
      @campaign.influencer_ids = array
      @campaign.save
    end

    respond_to do |format|
      format.html { redirect_to influencer_path(@influencer) }
      format.js { render "added" }
    end
  end

  def remove_influencer
    @campaign = Campaign.find(params[:id])
    @influencer = Influencer.find(params[:influencer_id])
    
    placement = Placement.where(campaign_id: @campaign.id, influencer_id: @influencer.id)
    placement.destroy_all

    redirect_to @campaign
  end

  def messaged
    message = Message.create!(influencer_id: params[:influencer_id], campaign_id: params[:campaign_id])

    @influencer = Influencer.find(params[:influencer_id])

    if message.save
      respond_to do |format|
        format.js { render "messaged" }
      end
    end
  end

  private 

  def check_plan
    if current_user.plan_id == nil
      redirect_to onboarding_path(:plan), :alert => "You need to subscribe to a plan."
    end
  end

  def campaign_params
  	params.require(:campaign).permit(:name, :description, :user_id, :influencer_ids => [])
  end
end
