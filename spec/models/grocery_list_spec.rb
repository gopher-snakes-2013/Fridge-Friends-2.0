require 'spec_helper'

describe GroceryList do
  it { should belong_to :fridge }
  it { should have_many :items }
end