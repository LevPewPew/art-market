class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]

  def success
    listing_id = params[:listingId].to_i
    @listing = Listing.find(listing_id)
    Purchase.create(listing_id: listing_id, user_id: current_user.id)
  end

  def webhook
    # these params come from that ?param&anotherParam formatted params that are defined in the listing controller as the stripe session success_url
    payment_id = params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_id)
    listing_id = payment.metadata.listing_id
    user_id = payment.metadata.user_id

    # need this as stripe is expecting it and will keep retrying until it gets it
    status 200
  end
end