class AddDescriptionToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :description, :string
  end
end
