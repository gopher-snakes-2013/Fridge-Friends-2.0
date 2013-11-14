class Fridge < ActiveRecord::Base
  attr_accessible :name, :creator_id
  has_many :items
  has_many :grocery_lists
  belongs_to :creator, :class_name => "User"
  has_and_belongs_to_many :users
  validates :name, presence: true, uniqueness: { :scope => [:creator_id] }
  # validates_uniqueness_of :name, :scope => [:creator_id]
  
  def owner?(user)
    self.users.include? user
  end

  def creator?(user)
    self.creator == user
  end

  def is_shared?
    self.users.length >= 2
  end

  def fridge_items
    self.items.select { |item| item.grocery_list_id == nil}
  end

  def find_friends(user)
    self.users - [user]
  end

  def add_friend(user)
    self.users << user
  end

end