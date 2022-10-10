class RoomsController < ApplicationController
  before_action :set_room, except: %i[index new create]
  before_action :authenticate_user!, except: [:show]
  def index
    @rooms = current_user.rooms
  end

  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      redirect_to listing_room_path(@room), notice: "Saved...."
    else
      flash[:alert] = "Something Went wrong"
      render :new
    end
  end

  def listing
  end

  def pricing
  end

  def description
  end

  def photo_upload
  end

  def amenities
  end

  def location
  end

  def show

  end

  def update
    if @room.update(room_params)
      flash[:notice] = "Saved"
    else
      flash[:notice] = "Something Went Wrong"
      redirect_back(fallback_location: request.referer)
    end
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:home_type, :room_type, :acommodate, :bed_room, :bath_room, :listing_name, :summary, :address, :is_tv, :is_kitchen, :is_air, :is_heating, :is_internet, :price, :active )
  end
end
