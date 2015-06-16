class AddDateToNewsArticles < ActiveRecord::Migration
  def change
    add_column :news_articles, :date, :date
  end
end
