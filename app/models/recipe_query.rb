class RecipeQuery < ActiveRecord::Base
  attr_accessible :terms, :user_id
  has_many :recipes
  belongs_to :user

  validates :terms, presence: true
  validates_uniqueness_of :terms, :scope => :user_id
end