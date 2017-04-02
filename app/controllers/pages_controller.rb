class PagesController < ApplicationController
  def index
  	@hide_nav = true

  	if user_signed_in?  
  		#redirect_to campaigns_path
  	end
  end

  def sign_up
  	@influencer = Influencer.new
  end
end
