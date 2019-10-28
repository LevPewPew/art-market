class ListingsController < ApplicationController
  before_action :authenticate_user!, only: [:my_listings]
  before_action :set_listing, only: [:show]
  before_action :set_user_listing, only: [:edit, :update, :destroy]
  after_action :join_styles_to_listing, only: [:create]

  def index
    @listings = Listing.all
  end

  def my_listings
    @listings = current_user.listings
  end

  def show
  end

  def new
    @listing = Listing.new
    # just going to have 3 fields already there with option for None
    # this is because I haven't learned JavaScript yet to dynamically create more or less of these fields in the form with a click of a button
    3.times { @listing.listings_styles.build }
  end

  def edit
  end

  def create
    @listing = current_user.listings.new(listing_params)

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_listing
      @listing = Listing.find(params[:id])
    end

    def set_user_listing
      @listing = current_user.listings.find_by_id(params[:id])
      if @listing.nil?
        redirect_to listings_path
      end
    end

    def join_styles_to_listing
      listing = Listing.last
      listings_style = ListingsStyle.last
      listings_style.update(listing_id: listing.id)
    end

    def listing_params
      params.require(:listing).permit(:title, :artist, :price, :description, :picture, :user_id, listings_styles_attributes: [:id, :listing_id, :style_id])
    end
end
