class Fridge < ActiveRecord::Base
  attr_accessible :name, :creator_id
  validates_presence_of :name
  validates_uniqueness_of :name, :scope => [:creator_id]
  has_and_belongs_to_many :users
  has_many :items
  has_many :grocery_lists
  before_create :set_creator

  def owner?(user)
    self.users.include? user
  end

  def creator?(user)
    self.creator == user
  end

  def friends_excluding(user)
    self.users - user
  end

  def owner?(user)
    self.users.include? user
  end

  def is_shared?
    self.users.length >= 2
  end

  def related_items
    items.all.select &:no_grocery_list?
  end

  private
  def set_creator
    self.creator = self.users.first
  end
end
