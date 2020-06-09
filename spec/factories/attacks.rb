FactoryBot.define do
  factory :attack, class: Attack do
    name { Faker::Games::Pokemon.move }
    pp { rand(5..45) }
    attack { [rand(10..150).to_s,'--'].shuffle.first }
    accuracy { rand(10..101) }
    effect { "did work" }
    attack_type { ["Normal","Fire","Water","Grass","Electric","Ice","Fighting","Poison","Ground","Flying","Psychic","Bug","Rock","Ghost","Dark","Dragon","Steel","Fairy"].shuffle.first }
    type_img { "https://www.serebii.net/pokedex-bw/type/physical.png" }
  end
end
