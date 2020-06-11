class AttacksPokemon < ApplicationRecord
  belongs_to :attack
  belongs_to :pokemon
end
