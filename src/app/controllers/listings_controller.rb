class ListingsController < ApplicationController
  before_action :authenticate_user!, only: [:my_listings, :my_purchases, :my_sales, :new]
  before_action :fill_user_details_prompt, only: [:new]
  # before_action :reject_listing_if_user_details_blank, only: [:create]
  before_action :set_listing, only: [:show]
  before_action :set_user_listing, only: [:edit, :update, :destroy]
  after_action :join_styles_to_listing, only: [:create]

  # all the "q" stuff and .ransack, is for the ransack gem which is a searchbar

  # all non purchased listings
  def index
    @q = Listing.all.where('id NOT IN (SELECT DISTINCT(listing_id) FROM purchases)').ransack(params[:q])
    @listings = @q.result(distinct: true).page(params[:page]).per(10)
  end

  # current users' listings that are unpurchased (i.e. there is not matching row in the purchases table)
  def my_listings
    @listings = current_user.listings.where('id NOT IN (SELECT DISTINCT(listing_id) FROM purchases)').page(params[:page]).per(10)
  end

  # any listing that has been purchased by the current user
  def my_purchases
    @listings = Listing.joins(:purchase).merge(Purchase.where(user_id: current_user.id)).page(params[:page]).per(10)
  end

  # any current user' listings that have been purchased
  def my_sales
    @listings = current_user.listings.joins(:purchase).merge(Purchase.all).page(params[:page]).per(10)
  end

  def show
    @comment = Comment.new
    address = @listing.user.user_detail.address
    line_1 = address.line_1
    line_2 = address.line_2
    city = address.city
    state = address.state
    postcode = address.postcode
    unnormalized_address = [line_1, line_2, city, state, postcode]
    unnormalized_address = unnormalized_address.reject { |field| !field.present? }
                                               .join(" ")
    begin
      @coords = Geocoder.search(unnormalized_address).first.coordinates
    rescue
      # latitude and longitude of the North Pole
      @coords = [85, -135]

      # TODO pass through a notice/flash message saying address not available/real
    end

    if !current_user.nil?
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
    def fill_user_details_prompt
      ud = current_user.user_detail
      empty_user_details = [ud.name, ud.address.line_1, ud.address.city, ud.address.postcode].any? { |field| !field.present? }
      if empty_user_details
        flash[:new_listing] = "Wait! Please ensure details are filled in before listing a piece, otherwise potential buyers won't be able to see this information."
        redirect_to edit_user_detail_path(current_user.user_detail)
      end
    end

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
