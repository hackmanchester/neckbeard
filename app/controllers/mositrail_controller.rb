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
    if (current_exhibit.pin == params[:pin])
      destination_exhibit = Exhibit.find(:first, :conditions => {:sequence => current_exhibit.sequence + 1})  
    else
      flash[:error] = "Incorrect pin, please try again!!"
      destination_exhibit = current_exhibit
    end
    
    if (destination_exhibit == nil)
      redirect_to :action => "congratulate"
    else
      redirect_to :action => "show", :id => destination_exhibit.id
    end
  	
  end

  def congratulate
  end


end
