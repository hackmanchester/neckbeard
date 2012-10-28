class CreateUser < ActiveRecord::Migration
  def up
  	create_table :users do |g|
  		g.integer :score
  	end
  end

  def down
  end
end
