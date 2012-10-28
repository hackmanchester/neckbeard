class CreateTrail < ActiveRecord::Migration
  def up
  	create_table :trails do |g|
  		g.string :name
  	end
  end

  def down
  end
end
