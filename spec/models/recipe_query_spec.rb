require 'spec_helper'

describe RecipeQuery do
  it { should validate_presence_of(:terms) }
  it { should belong_to(:user) }
  it { should have_many(:recipes) }
end