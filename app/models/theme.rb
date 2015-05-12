class Theme < ActiveRecord::Base
  validates :title, presence: true
end
