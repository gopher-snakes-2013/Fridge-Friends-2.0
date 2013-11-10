require 'spec_helper'

describe User do
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }
  it { should validate_presence_of :phone_number }
  it { should validate_presence_of :name }
  it { should have_and_belong_to_many :fridges }
  it { should allow_value('234-234-2342').for(:phone_number) }
  it { should_not allow_value('2342342342').for(:phone_number) }
  it { should_not allow_value('(234)234-2342').for(:phone_number) }
end