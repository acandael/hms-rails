class Member < ActiveRecord::Base
  has_many :member_publications
  has_many :publications, :through => :member_publications
  has_many :theme_members
  has_many :themes, :through => :theme_members
  validates :name, :email, presence: true
  attachment :image, type: :image
end
