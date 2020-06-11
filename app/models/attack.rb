class Attack < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :move_type
  validates_presence_of :pp
  validates_presence_of :attack
  validates_presence_of :accuracy
  validates_presence_of :effect
  validates_presence_of :attack_type
  validates_presence_of :move_type_img
  has_many :alternate_forms_attacks
  has_many :alternate_forms, through: :alternate_forms_attacks
end
