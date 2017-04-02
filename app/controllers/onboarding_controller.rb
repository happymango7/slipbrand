class OnboardingController < Wicked::WizardController
	before_action :authenticate_user!

	include Payola::StatusBehavior

	steps :plan, :info

	def show
		@hide_nav = true
		@hide_footer = true

		@user = current_user

		if Rails.env == "production" 
			@plan = Plan.find(1)
		else 
			@plan = Plan.find(4)
		end
    	
		render_wizard 
	end

	def update
      @user = current_user

      @user.update_attributes(user_params)

      render_wizard @user
    end

  def finish_wizard_path
		new_campaign_path
	end

    private

    def user_params
    	params.require(:user).permit(:first_name, :last_name, :plan_id, :company_name, :website)
    end	
end
 