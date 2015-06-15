class Member < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :member_publications
  has_many :publications, :through => :member_publications
  has_many :theme_members
  has_many :themes, :through => :theme_members
  validates :name, :email, presence: true
  attachment :image, type: :image

  validates :email, presence: true, format: /\A\S+@\S+\z/, uniqueness: { case_sensitive: false }
end
