FactoryBot.define do
  factory :item do
    name { Faker::Lorem.sentence }
    introduction { 'テスト投稿' }
    price        { '2000' }
    condition_id { '4' }
    category_id  { '5' }
    preparation_day_id { '4' }
    postage_type_id { '3' }
    prefecture_id { '9' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
