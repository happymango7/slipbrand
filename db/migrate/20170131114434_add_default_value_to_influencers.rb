class AddDefaultValueToInfluencers < ActiveRecord::Migration[5.0]
  def change
  	change_column :influencers, :twitter_follower_count, :integer, :default => 0
  	change_column :influencers, :instagram_follower_count, :integer, :default => 0
  	change_column :influencers, :youtube_subscribers_count, :integer, :default => 0
  end
end
 