class AddSummaryToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :summary, :text
  end
end
