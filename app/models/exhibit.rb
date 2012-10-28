class Exhibit < ActiveRecord::Base
	attr_accessible :title, :clue, :pin, :sequence, :trail_id
  
end