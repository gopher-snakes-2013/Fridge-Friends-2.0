class Fridge < ActiveRecord::Base
  attr_accessible :name
  validates_presence_of :name
  has_and_belongs_to_many :users
  has_many :items

  def owner?(user)
    self.users.include? user
  end
end