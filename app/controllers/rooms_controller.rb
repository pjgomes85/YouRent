class RoomsController < ApplicationController
  before_action :set_room, except: %i[index new create]
  before_action :authenticate_user!, except: [:show]
  before_action :is_authorised, only: %i[listing pricing description photo_upload amenities location update]

  def index
    @listings = current_user.rooms
    @rooms = Room.all

  end

  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      redirect_to listing_room_path(@room), notice: "Your Room has been Published ...."
    else
      flash[:alert] = "Something Went wrong"
      render :new
    end
  end

  def listing
    # @listing = current_user.rooms
  end

  def pricing
  end

  def description
  end

  def photo_upload
    # @photos = @room.photos
  end

  def amenities
  end

  def location

  end

  def show
    @rooms = Room.all
    @photos = @room.photos
    @room = Room.find(params[:id])
    @markers = [{ lat: @room.latitude, lng: @room.longitude, info_window: render_to_string(partial: "popup") }]
    @reviews = @room.reviews
    @asReview = @reviews.find_by(user_id: current_user.id) if current_user
  end

  def update
    if @room.update(room_params)
      flash[:notice] = "Saved"
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = "Something Went Wrong"
      redirect_back(fallback_location: request.referer)
    end
  end

  private

  def is_authorised
    redirect_to root_path, alert: "You don't have permission" unless current_user.id == @room.user_id
  end


  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:home_type, :room_type, :acommodate, :bed_room, :bath_room, :listing_name, :summary, :address, :is_tv, :is_kitchen, :is_air, :is_heating, :is_internet, :price, :active, photos: [] )
  end
end
