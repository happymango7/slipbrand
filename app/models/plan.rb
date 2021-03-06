class Plan < ApplicationRecord
	include Payola::Plan
	
	has_many :users

	validates :stripe_id, inclusion: { in: Plan.pluck('DISTINCT stripe_id'),
     message: "not a valid subscription plan" }

	def redirect_path(subscription)
		'/onboarding/info'
	end
end
 