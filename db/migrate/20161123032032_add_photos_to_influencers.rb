class AddPhotosToInfluencers < ActiveRecord::Migration[5.0]
  def up
    add_attachment :influencers, :avatar
    add_attachment :influencers, :cover
  end

  def down
    remove_attachment :influencers, :avatar
    remove_attachment :influencers, :cover
  end
end
