FactoryBot.define do
  factory :item do
    name                 {'名前'}
    description          {'説明'}
    category_id          {2}
    status_id            {2}
    shipping_cost_id     {2}
    shipping_area_id     {2}
    shipping_day_id      {2}
    price                {'1000'}
    association          :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    end
end
