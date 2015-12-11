require 'rails_helper'

describe Publication do
  it { should belong_to(:category) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:category) }
  it { should have_many(:members) }
  it { should have_many(:themes) }
  it { should validate_length_of(:summary).is_at_most(400) }


  it "accepts properly formatted links" do
    links = %w[http://www.somewebsite.com http://somewebsite.com]

    links.each do |link|
      publication = Publication.new(link: link)

      publication.valid?

      expect(publication.errors[:link].any?).to eq(false)
    end
  end

  it "rejects improperly formated links" do
    links = %w[www.somewebsite.com somewebsite.com]

    links.each do |link|
      publication = Publication.new(link: link)

      publication.valid?

      expect(publication.errors[:link].any?).to eq(true)
    end
  end
end
