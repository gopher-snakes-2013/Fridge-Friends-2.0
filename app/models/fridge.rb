class Fridge < ActiveRecord::Base
  attr_accessible :name
  validates_presence_of :name
  validates_uniqueness_of :name, :scope => [:creator_id]
  has_and_belongs_to_many :users
  has_many :items

  def owner?(user)
    self.users.include? user
  end
end