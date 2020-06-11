class Nature < ApplicationRecord
  validates_presence_of :nature
  validates_presence_of :increases
  validates_presence_of :decreases
end
