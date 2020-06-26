# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require_relative '../app/models/abilities_alternate_form.rb'
require_relative '../app/models/abilities_pokemon.rb'
require_relative '../app/models/ability.rb'
require_relative '../app/models/alternate_form.rb'
require_relative '../app/models/alternate_forms_attack.rb'
require_relative '../app/models/attack.rb'
require_relative '../app/models/attacks_pokemon.rb'
require_relative '../app/models/item.rb'
require_relative '../app/models/nature.rb'
require_relative '../app/models/pokemon.rb'


AbilitiesAlternateForm.destroy_all
AbilitiesPokemon.destroy_all
Ability.destroy_all
AlternateForm.destroy_all
AlternateFormsAttack.destroy_all
Attack.destroy_all
AttacksPokemon.destroy_all
Item.destroy_all
Nature.destroy_all
Pokemon.destroy_all

Rake::Task['import:all'].invoke
