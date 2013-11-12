require 'spec_helper'

describe Item do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:category) }
  it { should validate_presence_of(:fridge_id) }
  it { should belong_to(:fridge) }
  it { should belong_to(:grocery_list)}
  it { should validate_uniqueness_of(:name), scope: [:grocery_list_id] }
  it { should validate_presence_of(:creator_id) }
end