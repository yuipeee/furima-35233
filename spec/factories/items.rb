FactoryBot.define do
  factory :item do
    name                 {'test'}
    description          {'test'}
    category_id          {'test'}
    status_id            {'test'}
    shipping_cost_id     {'test'}
    shipping_area_id     {'test'}
    shipping_day_id      {'test'}
    price                {1000}
    image                {'image'}
  end
end
