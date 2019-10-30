class ListingsController < ApplicationController
  before_action :authenticate_user!, only: [:my_listings, :my_purchases, :my_sales]
  before_action :set_listing, only: [:show]
  before_action :set_user_listing, only: [:edit, :update, :destroy]
  after_action :join_styles_to_listing, only: [:create]

  # all non purchased listings
  def index
    @listings = Listing.all.where('id NOT IN (SELECT DISTINCT(listing_id) FROM purchases)')
  end

  # current users' listings that are unpurchased (i.e. there is not matching row in the purchases table)
  def my_listings
    @listings = current_user.listings.where('id NOT IN (SELECT DISTINCT(listing_id) FROM purchases)')
  end

  # any listing that has been purchased by the current user
  def my_purchases
    @listings = Listing.joins(:purchase).merge(Purchase.where(user_id: current_user.id))
  end

  # any current user' listings that have been purchased
  def my_sales
    @listings = current_user.listings.joins(:purchase).merge(Purchase.all)
  end

  def show
    @comment = Comment.new

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: [{
        name: @listing.title,
        description: @listing.description,
        amount: @listing.price * 100,
        currency: 'aud',
        quantity: 1
      }],
      payment_intent_data: {
        metadata: {
          user_id: current_user.id,
          listing_id: @listing.id
        }
      },
      success_url: "#{root_url}payments/success?userId=#{current_user.id}&listingId=#{@listing.id}",
      cancel_url: "#{root_url}listings"
    )
    
    @session_id = session.id
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
