class CreateExhibits < ActiveRecord::Migration
  def up
  	create_table :exhibits do |g|
  		g.string :title
  		g.string :clue
  		g.string :pin
  		g.integer :sequence
  	end
  end

  def down
  end
end
