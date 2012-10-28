class MositrailController < ApplicationController
  def welcome
  end

  def register
    user = User.new :name => params[:name], :score => 0
    user.save
    redirect_to :action => "pick_trail", :user_id => user.id
  end

  def pick_trail
    @trails = Trail.all
    @user_id = params[:user_id]
  end

  def start
    first_exhibit = Exhibit.find(:first, :conditions => {:sequence => 0})
    redirect_to :action => "show", :id => first_exhibit.id, :user_id => params[:user_id]
  end

  def show
    @exhibit = Exhibit.find(params[:id])
    @user_id = params[:user_id]
  end

  def try
    current_exhibit = get_current_exhibit(params)

    if (current_exhibit.pin == params[:pin])
      user  = get_current_user(params)
      user.score = user.score + 1
      user.save
      destination_exhibit = get_next_exhibit(current_exhibit)
    else
      flash[:error] = "Incorrect pin, please try again!!"
      destination_exhibit = current_exhibit
    end

    finish_or_show_next_exhibit(destination_exhibit, params)

  end

  def get_current_user(params)
    User.find(params[:user_id])
  end 

  def get_current_exhibit(params)
    Exhibit.find(params[:id])
  end

  def get_next_exhibit(current_exhibit)
    Exhibit.find(:first, :conditions => {:sequence => current_exhibit.sequence + 1})
  end

  def finish_or_show_next_exhibit(next_exhibit, params)
    if (next_exhibit == nil)
      redirect_to :action => "congratulate", :user_id => params[:user_id]
    else
      redirect_to :action => "show", :id => next_exhibit.id, :user_id => params[:user_id]
    end
  end

  def congratulate
    @user = get_current_user(params)
  end

  def skip
    current_exhibit = Exhibit.find(params[:id])
    next_exhibit = get_next_exhibit(current_exhibit)
    flash[:notice] = "Previous exhibit skipped."

    finish_or_show_next_exhibit(next_exhibit, params)

  end




end
