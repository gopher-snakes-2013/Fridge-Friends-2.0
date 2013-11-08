require 'spec_helper'

describe Fridge do
  it { should validate_presence_of(:name) }
  it { should have_many(:items) }
  it { should have_and_belong_to_many :users}
end