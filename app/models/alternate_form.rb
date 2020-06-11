class AlternateForm < ApplicationRecord
  validates_presence_of :pokedex_number
  validates_presence_of :name
  validates_presence_of :type_1
  validates_presence_of :type_2
  validates_presence_of :ability_1
  validates_presence_of :ability_2
  validates_presence_of :ability_3
  validates_presence_of :ability_4
  validates_numericality_of :hp
  validates_numericality_of :defense
  validates_numericality_of :attack
  validates_numericality_of :special_attack
  validates_numericality_of :special_defense
  validates_numericality_of :speed
  validates_presence_of :image_url
  has_many :abilities_alternate_forms
  has_many :abilities, through: :abilities_alternate_forms
  has_many :alternate_forms_attacks
  has_many :attacks, through: :alternate_forms_attacks
end
