class User < ActiveRecord::Base
  include Clearance::User
  attr_accessible :email, :password, :name, :phone_number, :customer_id, :opted_in
  validates :name, presence: true
  validates :phone_number, format: /\d{3}-\d{3}-\d{4}/
  has_and_belongs_to_many :fridges
  has_many :recipe_queries
  has_and_belongs_to_many :recipes
end
