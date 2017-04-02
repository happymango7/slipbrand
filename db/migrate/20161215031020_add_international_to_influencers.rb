class AddInternationalToInfluencers < ActiveRecord::Migration[5.0]
  def change
  	add_column :influencers, :international, :boolean, :default => false
  end
end
