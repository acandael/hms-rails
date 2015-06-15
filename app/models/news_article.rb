class NewsArticle < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, :body, presence: true
  validates :link, format: URI::regexp(%w(http https)), allow_blank: true
  attachment :image, type: :image
  attachment :document
end
