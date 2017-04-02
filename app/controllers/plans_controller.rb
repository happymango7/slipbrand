class PlansController < ApplicationController 
	include Payola::StatusBehavior
	def new
		@plan = Plan.find_by!(stripe_id: params[:plan])
	end

	def create 
	    # do any required setup here, including finding or creating the owner object
	   	owner = current_user # this is just an example for Devise

	    params[:plan] = Plan.find_by(id: params[:plan_id])
	    params[:stripeEmail] = current_user.email

	    current_user.plan = params[:plan]
	    current_user.save

	    # call Payola::CreateSubscription
	    subscription = Payola::CreateSubscription.call(params, owner)

	    # Render the status json that Payola's javascript expects
	    render_payola_status(subscription)
	end
end
