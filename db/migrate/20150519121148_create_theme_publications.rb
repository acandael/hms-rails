class CreateThemePublications < ActiveRecord::Migration
  def change
    create_table :theme_publications do |t|
      t.belongs_to :theme, index:true
      t.belongs_to :publication, index:true
    end
  end
end
