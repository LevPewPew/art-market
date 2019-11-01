class RemoveListingFromPurchase < ActiveRecord::Migration[5.2]
  def change
    remove_reference :purchases, :listing, foreign_key: true
  end
end
