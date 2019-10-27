class CreateListingsStyles < ActiveRecord::Migration[5.2]
  def change
    create_table :listings_styles do |t|
      t.references :listing, foreign_key: true
      t.references :style, foreign_key: true

      t.timestamps
    end
  end
end
