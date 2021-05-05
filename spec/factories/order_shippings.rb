FactoryBot.define do
  factory :order_shipping do
    post_code        {'123-4567'}
    shipping_area_id {2}
    city             {'test'}
    address          {'test'}
    building_name    {'test'}
    phone_number     {'09012345678'}
    token            {"tok_abcdefghijk00000000000000000"}
  end
end
