require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @seller = FactoryBot.build(:user)
    @item = FactoryBot.build(:item, user_id: @seller)
    @buyer = FactoryBot.build(:user)
    @order = FactoryBot.build(:order, user_id: @buyer, item_id: @item)
  end

  describe '商品購入機能' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order).to be_valid
      end
      it 'address_buildingは空でも保存できること' do
        @order.address_building = ''
        expect(@order).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'address_postcodeが空だと保存できないこと' do
        @order.address_postcode = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address postcode can't be blank")
      end
      it 'address_postcodeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order.address_postcode = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include("Address postcode is invalid. Enter it as follows (e.g. XXX-XXXX)")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @order.prefecture_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'address_choが空だと保存できないこと' do
        @order.address_cho = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address cho can't be blank")
      end
      it 'address_otherが空だと保存できないこと' do
        @order.address_other = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address other can't be blank")
      end
      it 'tel_numberが空だと保存できないこと' do
        @order.tel_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Tel number can't be blank")
      end
      it 'tel_numberが全角数字だと保存できないこと' do
        @order.tel_number = '０１２３４５６７８９'
        @order.valid?
        expect(@order.errors.full_messages).to include("Tel number must be 10-11 digits 半角 number(NOT enter - )")
      end
      it 'tel_numberに記号が入っていると保存できないこと' do
        @order.tel_number = '0123-456-789'
        @order.valid?
        expect(@order.errors.full_messages).to include("Tel number must be 10-11 digits 半角 number(NOT enter - )")
      end
      it 'tel_numberが10桁未満だと保存できないこと' do
        @order.tel_number = '012345678'
        @order.valid?
        expect(@order.errors.full_messages).to include("Tel number must be 10-11 digits 半角 number(NOT enter - )")
      end
      it 'tel_numberが12桁以上だと保存できないこと' do
        @order.tel_number = '012345678901'
        @order.valid?
        expect(@order.errors.full_messages).to include("Tel number must be 10-11 digits 半角 number(NOT enter - )")
      end
      it "tokenが空では登録できないこと" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end

end
