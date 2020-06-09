FactoryBot.define do
  factory :attack, class: Attack do
    name { Faker::Games::Pokemon.move }
    type { ["Normal","Fire","Water","Grass","Electric","Ice","Fighting","Poison","Ground","Flying","Psychic","Bug","Rock","Ghost","Dark","Dragon","Steel","Fairy"].shuffle.first }
    pp { rand(5..45) }
    attack { [rand(10..150).to_s,'--'].shuffle.first }
    accuracy { rand(10..101) }
    effect { "did work" }
  end
end
