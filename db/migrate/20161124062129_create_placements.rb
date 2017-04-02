class CreatePlacements < ActiveRecord::Migration[5.0]
  def change
    create_table :placements do |t|
      t.references :campaign, foreign_key: true
      t.references :influencer, foreign_key: true

      t.timestamps
    end
  end
end
