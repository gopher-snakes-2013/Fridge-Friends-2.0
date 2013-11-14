class User < ActiveRecord::Base
  include Clearance::User
  attr_accessible :email, :password, :name, :phone_number, :customer_id, :opted_in
  has_many :recipe_queries
  has_many :created_fridges, :foreign_key => :creator_id, :class_name => "Fridge"
  has_many :created_items, :foreign_key => :creator_id, :class_name => "Item"
  has_and_belongs_to_many :fridges
  has_and_belongs_to_many :recipes
  validates :phone_number, format: /\d{3}-\d{3}-\d{4}/, allow_blank: true
  validates :name, presence: true
end
