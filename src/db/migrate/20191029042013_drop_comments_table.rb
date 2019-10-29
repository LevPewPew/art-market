class DropCommentsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :comments do |t|
      t.text "body"
      t.bigint "listing_id"
      t.bigint "user_id"
      t.timestamps null: false
    end
  end
end
