FactoryBot.define do
  factory :order_sending_destinations do
    post_code      { '123-4567' }
    prefecture_id  { '2' }
    city           { '田中市' }
    house_number   { '田中町田中番地' }
    building_name  { '田中ビル101号' }
    phone_number   { '08088889999' }
    token          { 'ENV["PAYJP_PUBLIC_KEY"]' }
    price          { '3000' }
    order_id       { 1 }

    association :user
    association :item
  end
end
