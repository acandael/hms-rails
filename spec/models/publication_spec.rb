require 'rails_helper'

describe Publication do
  it { should validate_presence_of(:title) }
  it { should have_many(:members) }
  it { should have_many(:themes) }
end
