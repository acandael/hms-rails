class Member < ActiveRecord::Base
  has_many :member_publications
  has_many :publications, :through => :member_publications
  validates :name, :email, presence: true
  attachment :image, type: :image
end
