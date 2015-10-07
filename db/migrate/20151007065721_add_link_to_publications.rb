class AddLinkToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :link, :string
  end
end
