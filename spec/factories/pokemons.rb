FactoryBot.define do
  factory :pokemon, class: Pokemon do
    dex_number { rand(1..400) }
    name { Faker::Games::Pokemon.name }
    type_1 { ["Normal","Fire","Water","Grass","Electric","Ice","Fighting","Poison","Ground","Flying","Psychic","Bug","Rock","Ghost","Dark","Dragon","Steel","Fairy"].shuffle.first }
    type_2 { ["Normal","Fire","Water","Grass","Electric","Ice","Fighting","Poison","Ground","Flying","Psychic","Bug","Rock","Ghost","Dark","Dragon","Steel","Fairy","none"].shuffle.first }
    ability_1 { ["Blaze","Torrent","Overgrow","Swarm","Cheek Pouch"] }
    ability_2 { ["Ball Fetch","Chlorophyll","Fluffy","none","none"] }
    ability_3 { ["Cute Charm","Oblivious","none","none","none"] }
    ability_4 { ["Grassy Surge","none","none","none","none"] }
    hp { rand(50..140) }
    attack { rand(50..140) }
    defense { rand(50..140) }
    special_attack { rand(50..140) }
    special_defense { rand(50..140) }
    speed { rand(50..140) }
    image_url { "url.picture" }
  end
end
