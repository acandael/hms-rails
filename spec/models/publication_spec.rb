require 'rails_helper'

describe Publication do
  it { should have_many(:members) }
  it { should have_many(:themes) }
end
