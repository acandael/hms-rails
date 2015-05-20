class ThemeMember < ActiveRecord::Base
  belongs_to :theme
  belongs_to :member
end
