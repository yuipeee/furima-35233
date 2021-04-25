require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品情報の保存' do
    context '保存できる場合' do
      it "name,description,category_id,status_id,shipping_cost_id,shipping_area_id,shipping_day_id,price,imageが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '保存できない場合' do
      it "nameが空では保存できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "descriptionが空では保存できない" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it "category_idが未選択では保存できない" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "status_idが未選択では保存できない" do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it "shipping_cost_idが未選択では保存できない" do
        @item.shipping_cost_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
      end

      it "shipping_area_idが未選択では保存できない" do
        @item.shipping_area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end

      it "shipping_day_idが未選択では保存できない" do
        @item.shipping_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end

      it "priceが空では保存できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "imageが空では保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "priceが設定範囲外だと保存できない" do
       @image.price = 100
       @item.valid?
       expect(@item.errors.full_messages).ro include("Price Out of setting range")
      end

       it "priceが全角数字だと保存できない" do
        @image.price = １２３
        @item.valid?
        expect(@item.errors.full_messages).ro include("Price is invalid")
       end
    end
  end
end