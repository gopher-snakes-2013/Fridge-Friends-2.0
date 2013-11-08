require 'spec_helper'

describe User do
  xit { should validate_presence_of :email }
  xit { should validate_presence_of :password }
  xit { should validate_presence_of :phone_number }
  xit { should validate_presence_of :name }
  xit { should have_and_belong_to_many :fridges }
end