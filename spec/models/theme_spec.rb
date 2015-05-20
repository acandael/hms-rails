require 'rails_helper'

describe Theme do
  it { should have_many(:publications) }
end
