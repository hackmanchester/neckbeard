class MositrailController < ApplicationController

  def start 
  	redirect_to :action => "show", :id => 1
  end

  def show
  end

  def try
  	redirect_to :action => "show", :id => 1
  end

end
