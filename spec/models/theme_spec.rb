require 'rails_helper'

describe Theme do
  it { should validate_presence_of(:title) }
  it { should have_many(:publications) }
  it { should have_many(:members) }
end
