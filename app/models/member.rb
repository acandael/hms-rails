class Member < ActiveRecord::Base
  validates :name, :email, presence: true
end
