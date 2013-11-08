class User < ActiveRecord::Base
  include Clearance::User
  attr_accessible :name, :phone_number, :customer_id
  validates :name, presence: true
  validates :phone_number, presence: true
  has_and_belongs_to_many :fridges
end
