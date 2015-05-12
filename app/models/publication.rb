class Publication < ActiveRecord::Base
  has_many :member_publications
  has_many :members, :through => :member_publications
  validates :title, presence: true
  attachment :document
end
