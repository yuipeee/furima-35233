require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
   before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @shipping = FactoryBot.build(:order_shipping, user_id: user.id, item_id: item.id)
      sleep(0.1)
   end

   describe '購入商品の保存' do
    context '保存できる場合' do
      it "post_code、shipping_area_id、city、address、phone_numberが存在すれば登録できる" do
        expect(@shipping).to be_valid
      end
    end

    context '保存できない場合' do
      it "post_codeが空では保存できない" do
        @shipping.post_code = ''
        @shipping.valid?
        expect(@shipping.errors.full_messages).to include("Post code can't be blank")
      end

      it "shipping_area_idが未選択では保存できない" do
        @shipping.shipping_area_id = ''
        @shipping.valid?
        expect(@shipping.errors.full_messages).to include("Shipping area can't be blank")
      end

      it "cityが空では保存できない" do
        @shipping.city = ''
        @shipping.valid?
        expect(@shipping.errors.full_messages).to include("City can't be blank")
      end

      it "addressが空では保存できない" do
        @shipping.address = ''
        @shipping.valid?
        expect(@shipping.errors.full_messages).to include("Address can't be blank")
      end

      it "phone_numberが空では保存できない" do
        @shipping.phone_number = ''
        @shipping.valid?
        expect(@shipping.errors.full_messages).to include("Phone number can't be blank")
      end

      it "post_codeにハイフンがない場合保存できない" do
        @shipping.post_code = '1234567'
        @shipping.valid?
        expect(@shipping.errors.full_messages).to include("Post code is invalid")
      end

      it "phone_numberが11桁以上では保存できない" do
        @shipping.phone_number = '090123456789'
        @shipping.valid?
        expect(@shipping.errors.full_messages).to include("Phone number is invalid")
      end

    end  
  end
end