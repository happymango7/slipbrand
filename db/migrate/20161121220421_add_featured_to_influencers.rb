class AddFeaturedToInfluencers < ActiveRecord::Migration[5.0]
  def change
  	add_column :influencers, :featured, :boolean, :default => false
  end
end
