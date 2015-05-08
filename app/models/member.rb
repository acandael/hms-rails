class Member < ActiveRecord::Base
  validates :name, :email, presence: true
  attachment :image, type: :image
end
