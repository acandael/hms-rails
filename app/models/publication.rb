class Publication < ActiveRecord::Base
  has_many :member_publications
  has_many :members, :through => :member_publications
  has_many :theme_publications
  has_many :themes, :through => :theme_publications
  validates :title, presence: true
  validates_length_of :summary, maximum: 200
  attachment :document
end
