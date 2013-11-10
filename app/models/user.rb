class User < ActiveRecord::Base
  include Clearance::User
  attr_accessible :email, :password, :name, :phone_number, :customer_id
  validates :name, presence: true
  validates :phone_number, presence: true, format: /\d{3}-\d{3}-\d{4}/
  has_and_belongs_to_many :fridges
end
