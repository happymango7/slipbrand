class InfluencersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_plan

  def index
  	@featured_influencers = Influencer.where(featured: true)
  	@influencers = Influencer.all
  	@categories = Category.all
  end

  def show
  	@influencer = Influencer.find(params[:id])
  	@instagram_posts = RubyInstagramScraper.get_user_media_nodes( @influencer.instagram_username )
  	
    if @influencer.youtube_username?
      channel = Yt::Channel.new url: @influencer.youtube_username
      @videos = channel.videos
    end

  	if @influencer.twitter_username?
      if twitter_client.user(@influencer.twitter_username).protected == false
  		  @tweets = twitter_client.user_timeline(@influencer.twitter_username).take(6)
      else
        @tweets = []
      end
  	end
  end

  private 

  def check_plan
    if current_user.plan_id == nil
      redirect_to onboarding_path(:plan), :alert => "You need to subscribe to a plan."
    end
  end
end 
 