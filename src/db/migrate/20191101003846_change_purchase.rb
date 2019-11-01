class ChangePurchase < ActiveRecord::Migration[5.2]
  def change
    remove_index :purchases, :listing_id
    add_index :purchases, :listing_id, unique: true
  end
end
