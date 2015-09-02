require 'rails_helper'

describe Publication do
  it { should validate_presence_of(:title) }
  it { should have_many(:members) }
  it { should have_many(:themes) }
  it { should validate_length_of(:summary).is_at_most(200) }
end
