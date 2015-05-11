class Publication < ActiveRecord::Base
  validates :title, presence: true
  attachment :document
end
