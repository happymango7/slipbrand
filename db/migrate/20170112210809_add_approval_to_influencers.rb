class AddApprovalToInfluencers < ActiveRecord::Migration[5.0]
  def change
  	add_column :influencers, :approved, :boolean, :default => false
  end
end
