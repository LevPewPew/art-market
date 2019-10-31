class PagesController < ApplicationController
  def home
  end

  def user_settings
  end

  def admin_dashboard
  end
  
  def site_stats
    @users = User.all
    @listings = Listing.all.where('id NOT IN (SELECT DISTINCT(listing_id) FROM purchases)')
    @purchases = Purchase.all
    @comments = Comment.all
  end
end
