class OrderShipping
  include ActiveModel::Model
  attr_accessor :post_code, :shipping_area_id, :city, :address, :building_name, :phone_number, :product, :user_id

  with_options presence :true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipping_area_id, numericality: { other_than: 0 } 
    validates :city
    validates :address 
    validates :phone_number, format: {with: /\A\d{11}\z/}
    validates :prpduct
    validates :user_id
  end

    def save
      order = Order.create(product: product, user_id: user_id)
      Shipping.create(post_code: post_code, shipping_area_id: shipping_area_id, city: city, address: address, building_name: building_name, phone_number: phone_number)
    end
end