require 'rails_helper'

describe Member do
  it { should have_many(:publications) }
end
