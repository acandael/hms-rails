class Category < ActiveRecord::Base
  has_many :publications

  private
  
end
