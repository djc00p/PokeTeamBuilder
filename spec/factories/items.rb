FactoryBot.define do
  factory :item, class: Item do
    type { "berry"}
    image_url { "https://imgur.com/eux6mOc"}
    squence(:name) { |n| "Berry #{n}" }
    effect { "you got burned"}
  end
end
