class AddDocumentFilenameToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :document_filename, :string
  end
end
