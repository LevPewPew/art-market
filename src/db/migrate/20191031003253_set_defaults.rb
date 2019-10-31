class SetDefaults < ActiveRecord::Migration[5.2]
  def change
    change_column :user_details, :super_user, :boolean, default: false
    change_column :user_details, :comms_mngr, :boolean, default: false
  end
end
