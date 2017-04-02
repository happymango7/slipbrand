class RegistrationsController < Devise::RegistrationsController

	def change_plan
		plan = Plan.find_by!(id: params[:user][:plan_id].to_i)
	    unless plan == current_user.plan
	      #role = User.roles[plan.stripe_id]
	      if current_user.update_attributes!(plan: plan)
	        subscription = Payola::Subscription.find_by!(owner_id: current_user.id)
	        Payola::ChangeSubscriptionPlan.call(subscription, plan)
	        redirect_to edit_user_registration_path, :notice => "Plan updated to #{plan.name}."
	      else
	        flash[:alert] = 'Unable to change plan.' 
	        render :edit
	      end
	    end
	end 

	protected

  	def after_update_path_for(resource)
      campaigns_path
    end

	def after_sign_up_path_for(resource)
		onboarding_path(:plan)
	end

	private 

	def sign_up_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :plan_id, :website, :company_name)
  	end

	def account_update_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :plan_id, :website, :company_name)
	end
end
 