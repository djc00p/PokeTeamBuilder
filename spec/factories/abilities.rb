FactoryBot.define do
  factory :ability, class: Ability do
    sequence(:name) { |n| "Ability #{n}" }
    sequence(:game_despcription) { |n| "Blast you times #{n}"}
    sequence(:serebii_in_depth_description) { |n| "you blast them #{n} times the power"}
  end
end
