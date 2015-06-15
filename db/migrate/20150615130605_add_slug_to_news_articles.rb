class AddSlugToNewsArticles < ActiveRecord::Migration
  def change
    add_column :news_articles, :slug, :string
    add_index :news_articles, :slug, unique: true
  end
end
