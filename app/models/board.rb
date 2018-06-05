class Board < ApplicationRecord
  validates_presence_of :title
  has_many :lists


  def self.by_title(order = 'asc')
    order(:title)
  end

  def self.by_priority(order = 'asc')
    order(:priority)
  end

end
