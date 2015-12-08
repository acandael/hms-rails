class AddImageIdToThemes < ActiveRecord::Migration
  def change
    add_column :themes, :image_id, :integer
  end
end
