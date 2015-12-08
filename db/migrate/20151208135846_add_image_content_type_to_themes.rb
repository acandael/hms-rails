class AddImageContentTypeToThemes < ActiveRecord::Migration
  def change
    add_column :themes, :image_content_type, :string
    change_column :themes, :image_id, :string
  end
end
