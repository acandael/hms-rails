class Publication < ActiveRecord::Base
  has_many :member_publications
  has_many :members, :through => :member_publications
  has_many :theme_publications
  has_many :themes, :through => :theme_publications
  belongs_to :category
  validates :title, presence: true
  validates_length_of :summary, maximum: 400
  validates :link, format: URI::regexp(%w(http https)), allow_blank: true
  attachment :document

  scope :filter_by_category, ->(category){ filter(category).order(:title) }

  private

  def self.filter(filter)
    if filter
      where(category_id: filter)
    end
  end
end
