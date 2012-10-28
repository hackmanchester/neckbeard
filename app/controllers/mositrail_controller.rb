class MositrailController < ApplicationController

  def start 
  	first_exhibit = Exhibit.find(:first, :conditions => {:sequence => 0})
  	redirect_to :action => "show", :id => first_exhibit.id
  end

  def show
    @exhibit = Exhibit.find(params[:id])
  end

  def try
    current_exhibit = get_current_exhibit(params)
    if (current_exhibit.pin == params[:pin])
      destination_exhibit = get_next_exhibit(current_exhibit)
    else
      flash[:error] = "Incorrect pin, please try again!!"
      destination_exhibit = current_exhibit
    end

    finish_or_show_next_exhibit(destination_exhibit)
  	
  end

  def get_current_exhibit(params)
    Exhibit.find(params[:id])
  end

  def get_next_exhibit(current_exhibit)
    Exhibit.find(:first, :conditions => {:sequence => current_exhibit.sequence + 1})  
  end

  def finish_or_show_next_exhibit(next_exhibit)
    if (next_exhibit == nil)
      redirect_to :action => "congratulate"
    else
      redirect_to :action => "show", :id => next_exhibit.id
    end
  end

  def congratulate
  end

  def skip
    current_exhibit = Exhibit.find(params[:id])
    next_exhibit = get_next_exhibit(current_exhibit)
    flash[:notice] = "Previous exhibit skipped."

    finish_or_show_next_exhibit(next_exhibit)
    
  end




end
