class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :artist
      t.date :date_posted
      t.integer :price
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
