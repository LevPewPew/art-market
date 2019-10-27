class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :line_1
      t.string :line_2
      t.string :city
      t.integer :state
      t.integer :postcode
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
