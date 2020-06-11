FactoryBot.define do
  factory :nature, class: Item do
    nature { "Mild"}
    increase { "Sp. Attack"}
    decreases { "Attack" }
  end
end
