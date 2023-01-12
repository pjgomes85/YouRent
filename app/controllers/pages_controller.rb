class PagesController < ApplicationController
  def home
    @rooms = Room.where(active: true).limit(3)
    @rooms = Room.all
  end

  def search
    @rooms = Room.all
    if params[:query].present?
      sql_query = "room_type @@ :query OR address @@ :query OR acommodate @@ :query OR bed_room @@ :query OR bath_room @@ :query"
      @rooms = Room.where(sql_query, query: "%#{params[:query]}%")
    else
      @rooms = Room.all
    end
  end
end
