class AddExhibitTrailId < ActiveRecord::Migration
  def change
  	add_column :exhibits, :trail_id, :integer
  end
end
