class SearchController < ApplicationController
  before_action :authenticate_user!
  before_action :check_plan

  def index
	
  end

  private 

  def check_plan
    if current_user.plan_id == nil
      redirect_to onboarding_path(:plan), :alert => "You need to subscribe to a plan."
    end
  end
end
 