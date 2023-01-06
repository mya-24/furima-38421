require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item, user: @user)
  end

  describe '商品出品機能' do
    context '商品が出品できる' do
      it '必要な情報が揃っていれば商品が出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない' do
      it '商品画像がない場合、出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名の入力がない場合、出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品の説明がない場合、出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーで「---」を選択した場合、出品できない' do
        @item.category_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態で「---」を選択した場合、出品できない' do
        @item.condition_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料の負担者で「---」を選択した場合、出品できない' do
        @item.costperson_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Costperson can't be blank")
      end
      it '発送元の地域で「---」を選択した場合、出品できない' do
        @item.prefecture_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送元の地域で「---」を選択した場合、出品できない' do
        @item.prepareday_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prepareday can't be blank")
      end
      it '商品金額で300円以下を入力した場合、出品できない' do
        @item.price = '10'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '商品金額で9,999,999円以上を入力した場合、出品できない' do
        @item.price = '100000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it '商品金額に入力がない場合、出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '商品金額に全角数字を入力した場合、出品できない' do
        @item.price = '１２３４'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '商品金額に文字列を入力した場合、出品できない' do
        @item.price = 'あいうえお'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'userが紐づいていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end

    end
  end
end
