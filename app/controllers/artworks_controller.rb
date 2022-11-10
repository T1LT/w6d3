class ArtworksController < ApplicationController

  def index
    artworks = Artwork.all
    render json: artworks
  end

  def show
    artwork = Artwork.find_by(id: params[:id])
    render json: artwork
  end

  def update
    artwork = Artwork.find_by(id: params[:id])
    if artwork.update(artwork_params)
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 422
    end

  end

  def destroy
    artwork = Artwork.find_by(id: params[:id])
    if artwork.destroy
      redirect_to artworks_url
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end

  def create
    new_artwork = Artwork.new(artwork_params)
    if new_artwork.save
      render json: new_artwork
    else
      render json: new_artwork.errors.full_messages, status: 422
    end
  end

  private
  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end