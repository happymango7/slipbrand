class CreateInfluencers < ActiveRecord::Migration[5.0]
  def change
    create_table :influencers do |t|
      t.string :name
      t.string :description
      t.string :facebook_username
      t.string :instagram_username
      t.string :twitter_username
      t.string :youtube_username
      t.string :linkedin_username
      t.string :snapchat_username
      t.string :email
      t.string :location
      t.string :gender, :default => 'm'
      t.boolean :multicultural, :default => false

      t.timestamps
    end
  end
end
