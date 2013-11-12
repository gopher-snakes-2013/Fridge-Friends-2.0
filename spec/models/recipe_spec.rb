require 'spec_helper'

describe Recipe do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:recipe_query_id) }
  it { should validate_presence_of(:ingredients) }
end