class PagesController < ApplicationController
  def home
    @rooms = Room.where(active: true).limit(3)
    @rooms = Room.all
  end


  def search
    @rooms = Room.all


  	if params[:search].present? && params[:search].strip != ""
  		session[:loc_search] = params[:search]
  	end


  	# arrResult = Array.new

  	if session[:loc_search] && session[:loc_search] != ""
  		@rooms_address = Room.where(active: true).near(session[:loc_search], 5, order: 'distance')
  	else
  		@rooms_address = Room.where(active: true).all
  	end
  end

end
