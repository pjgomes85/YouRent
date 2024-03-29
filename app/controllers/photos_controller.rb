class PhotosController < ApplicationController
  def create
    @room = Room.find(params[:room_id])

    if params[:images]
      params[:images].each do |img|
        @room.photos.create(image: img)
      end

      @photos = @room.photos
      redirect_back(fallback_location: request.referer)
    end
  end


  def destroy
    raise
    @photo = Photo.find(params[:id])
    room = @photo.room
    @photo.purge
    @photos = Photo.where(room_id: room.id)
    redirect_back(fallback_location: request.referer)
    respond_to :js
  end
end
