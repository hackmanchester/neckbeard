class MositrailController < ApplicationController

  def start 
  	first_exhibit = Exhibit.find(:first, :conditions => {:sequence => 0})
  	redirect_to :action => "show", :id => first_exhibit.id
  end

  def show
    @exhibit = Exhibit.find(params[:id])
  end

  def try
    current_exhibit = Exhibit.find(params[:id])
    next_exhibit = Exhibit.find(:first, :conditions => {:sequence => current_exhibit.sequence + 1})
  	redirect_to :action => "show", :id => next_exhibit.id
  end

end
