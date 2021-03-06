require 'rails_helper'

describe Member do
  it { should have_many(:publications) }
  it { should have_many(:themes) }
  it { should validate_presence_of(:email) }

   
  it "accepts properly formatted email addresses" do
    emails = %w[user@example.com first.last@example.com]
    emails.each do |email|
      member = Member.new(email: email)
      member.valid?
      expect(member.errors[:email].any?).to eq(false)
    end
  end
   
  it "rejects improperly formatted email addresses" do
    emails = %w[@ user@ @example.com]
    emails.each do |email|
      member = Member.new(email: email)
      member.valid?
      expect(member.errors[:email].any?).to eq(true)
    end
  end

  it "accepts properly formatted links" do
    links = %w[http://www.somewebsite.com http://somewebsite.com]

    links.each do |link|
      member = Member.new(bibliography: link)

      member.valid?

      expect(member.errors[:bibliography].any?).to eq(false)
    end
  end


  it "rejects improperly formated links" do
    links = %w[www.somewebsite.com somewebsite.com]

    links.each do |link|
      member = Member.new(bibliography: link)

      member.valid?

      expect(member.errors[:bibliography].any?).to eq(true)
    end
  end
end
