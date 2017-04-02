class CreatePlanService
  def call
    p1 = Plan.where(name: 'Basic').first_or_initialize do |p|
      p.amount = 1599
      p.interval = 'month'
      p.stripe_id = 'basic'
      p.trial_period_days = 7
    end
    p1.save!(:validate => false)
    p2 = Plan.where(name: 'Premium').first_or_initialize do |p|
      p.amount = 2599
      p.interval = 'month'
      p.stripe_id = 'premium'
      p.trial_period_days = 7
    end
    p2.save!(:validate => false)
    p3 = Plan.where(name: 'Platinum').first_or_initialize do |p|
      p.amount = 4999
      p.interval = 'month'
      p.stripe_id = 'platinum'
      p.trial_period_days = 7
    end
    p3.save!(:validate => false)
  end
end
