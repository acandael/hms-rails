class Theme < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :theme_publications
  has_many :publications, :through => :theme_publications
  has_many :theme_members
  has_many :members, :through => :theme_members
  validates :title, presence: true
  validates_length_of :summary, maximum: 300
  attachment :image, type: :image
end
