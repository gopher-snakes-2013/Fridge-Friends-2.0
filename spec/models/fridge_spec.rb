require 'spec_helper'

describe Fridge do
  it { should validate_presence_of(:name) }
  it { should have_many(:items) }
  it { should have_one(:grocery_list)}
  it { should have_and_belong_to_many(:users)}
  it {should validate_uniqueness_of(:name), scope: [:creator_id]}
end