class AddUserDetailToAddress < ActiveRecord::Migration[5.2]
  def change
    add_reference :addresses, :user_detail, foreign_key: true
  end
end
