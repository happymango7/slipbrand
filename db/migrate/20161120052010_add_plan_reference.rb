class AddPlanReference < ActiveRecord::Migration[5.0]
  def change
  	add_reference :users, :plan, index: true, foreign_key: true
  end
end
