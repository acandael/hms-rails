class NewsArticle < ActiveRecord::Base
  validates :title, :body, presence: true
end
