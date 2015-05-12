class MemberPublication < ActiveRecord::Base
  belongs_to :member
  belongs_to :publication
end
