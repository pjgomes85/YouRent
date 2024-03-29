class PagesController < ApplicationController
  def home
    @rooms = Room.where(active: true).limit(3)
    @rooms = Room.all

  #   @markers = @rooms.geocoded.map do |flat|
  #     {
  #       lat: flat.latitude,
  #       lng: flat.longitude,
  #       marker_html: render_to_string(partial: "marker")
  #     }
  #   end
  end

  def search
    @rooms = Room.all

    if params[:query].present?
      sql_query = "room_type @@ :query OR address @@ :query OR listing_name @@ :query"
      @rooms = Room.where(sql_query, query: "%#{params[:query]}%")
    else
      @rooms = Room.all
    end
  end

  def self.search(query)
    string = query.to_s.gsub('.','')
    where("acommodate ?", "%#{string}%")
  end
end
