require 'spec_helper'

describe GroceryList do
  it { should belong_to :fridge }
  it { should have_many :items }
  it { should validate_uniqueness_of(:title), scope: [:fridge_id] }
  it { should validate_presence_of(:title) }
end