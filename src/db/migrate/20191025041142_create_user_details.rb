class CreateUserDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :user_details do |t|
      t.string :name
      t.text :bio
      t.boolean :super_user
      t.boolean :comms_mngr
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
