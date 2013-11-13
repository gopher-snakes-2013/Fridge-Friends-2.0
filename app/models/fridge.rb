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

  def is_shared?
    self.users.length >= 2
  end
end