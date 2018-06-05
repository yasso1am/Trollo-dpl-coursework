class Board < ApplicationRecord
  validates_presence_of :title
  has_many :lists
end
