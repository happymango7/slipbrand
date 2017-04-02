class AddFollowerCountsToInfluencers < ActiveRecord::Migration[5.0]
  def change
  	add_column :influencers, :instagram_follower_count, :integer
  	add_column :influencers, :youtube_subscribers_count, :integer
  	add_column :influencers, :twitter_follower_count, :integer
  end
end
