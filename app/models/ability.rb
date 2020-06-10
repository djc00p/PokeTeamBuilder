class Ability < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :game_description
  validates_presence_of :serebii_in_depth_description
  has_many :abilities_alternate_forms
  has_many :alternate_forms, through: :abilities_alternate_forms
  has_many :abilities_pokemons
  has_many :pokemons, through: :abilities_pokemons
end
