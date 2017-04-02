class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_plan

  def index
  	@categories = Category.all
  end

  def show
  	@category = Category.find(params[:id])
  	@influencers = Influencer.where(category_id: params[:id])
  end

  private 

  def check_plan
    if current_user.plan_id == nil
      redirect_to onboarding_path(:plan), :alert => "You need to subscribe to a plan."
    end
  end
end
 