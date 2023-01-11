class PagesController < ApplicationController
  def home
    @rooms = Room.where(active: true).limit(3)
    @rooms = Room.all
  end


  def search
    @movies = Room.all
    if params[:query].present?
      @movies = Room.where("address ILIKE ?", "%#{params[:query]}%")
    else
      @movies = Room.all
    end

  end
end
