class AddExternalAuthorsToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :external_authors, :string
  end
end
