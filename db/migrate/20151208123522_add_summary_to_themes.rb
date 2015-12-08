class AddSummaryToThemes < ActiveRecord::Migration
  def change
    add_column :themes, :summary, :text
  end
end
