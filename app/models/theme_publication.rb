class ThemePublication < ActiveRecord::Base
  belongs_to :theme
  belongs_to :publication
end
