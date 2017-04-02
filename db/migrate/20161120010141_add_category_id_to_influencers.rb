class AddCategoryIdToInfluencers < ActiveRecord::Migration[5.0]
  def change
  	add_column :influencers, :category_id, :integer
  end
end
