FactoryBot.define do
  factory :item, class: Item do
    nature { "Mild"}
    increase { "Sp. Attack"}
    decreases { "Attack" }
  end
end
