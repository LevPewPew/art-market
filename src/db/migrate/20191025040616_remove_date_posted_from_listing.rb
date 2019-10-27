class RemoveDatePostedFromListing < ActiveRecord::Migration[5.2]
  def change
    remove_column :listings, :date_posted, :date
  end
end
