class Pokemon < ApplicationRecord
  # Validations
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

  # Relationships
  has_many :abilities_pokemons
  has_many :abilities, through: :abilities_pokemons
  has_many :alternate_forms
  has_many :attacks_pokemons
  has_many :attacks, through: :attacks_pokemons
end
