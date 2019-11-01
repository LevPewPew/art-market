class AddListingToPurchase < ActiveRecord::Migration[5.2]
  def change
    add_reference :purchases, :listing, foreign_key: true, unique: true
  end
end
