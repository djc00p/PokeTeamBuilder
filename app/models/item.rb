class Item < ApplicationRecord
  # Validations
  validates_presence_of :item_type
  validates_presence_of :image_url
  validates_presence_of :name
  validates_presence_of :effect
end
