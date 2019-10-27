class RemoveDescriptionFromStyle < ActiveRecord::Migration[5.2]
  def change
    remove_column :styles, :description, :text
  end
end
