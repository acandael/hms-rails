class NewsArticle < ActiveRecord::Base
  validates :title, :body, presence: true
  attachment :image, type: :image
  attachment :document
end
