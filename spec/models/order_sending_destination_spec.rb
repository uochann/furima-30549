require 'rails_helper'

RSpec.describe OrderSendingDestinations, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_sending_destination = FactoryBot.build(:order_sending_destinations, user_id: @user.id, item_id: @item.id)
  end

  describe '商品を購入' do
    context '商品を購入できる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_sending_destination).to be_valid
      end

      it '建物名がなくても購入できる' do
        @order_sending_destination.building_name = nil
        expect(@order_sending_destination).to be_valid
      end
    end

    context '商品を購入できない場合' do
      it 'tokenが空では購入できない' do
        @order_sending_destination.token = nil
        @order_sending_destination.valid?
        expect(@order_sending_destination.errors[:token]).to include('を入力してください')
      end

      it 'prefecture_idが空では購入できない' do
        @order_sending_destination.prefecture_id = nil
        @order_sending_destination.valid?
        expect(@order_sending_destination.errors[:prefecture_id]).to include('を入力してください')
      end

      it 'prefectur_idが1だと登録できない' do
        @order_sending_destination.prefecture_id = '1'
        @order_sending_destination.valid?
        expect(@order_sending_destination.errors[:prefecture_id]).to include('は1以外の値にしてください')
      end

      it 'cityが空では購入できない' do
        @order_sending_destination.city = nil
        @order_sending_destination.valid?
        expect(@order_sending_destination.errors[:city]).to include('を入力してください')
      end

      it 'house_numberが空では購入できない' do
        @order_sending_destination.house_number = nil
        @order_sending_destination.valid?
        expect(@order_sending_destination.errors[:house_number]).to include('を入力してください')
      end

      it 'phone_numberが空では購入できない' do
        @order_sending_destination.phone_number = nil
        @order_sending_destination.valid?
        expect(@order_sending_destination.errors[:phone_number]).to include('を入力してください')
      end

      it 'priceが空では購入できない' do
        @order_sending_destination.price = nil
        @order_sending_destination.valid?
        expect(@order_sending_destination.errors[:price]).to include('を入力してください')
      end

      it 'post_codeが半角のハイフンを含んだ正しい形式でないと購入できない' do
        @order_sending_destination.post_code = '1234567'
        @order_sending_destination.valid?
        expect(@order_sending_destination.errors[:post_code]).to include('は不正な値です')
      end

      it '電話番号が11桁出ないと購入できない' do
        @order_sending_destination.phone_number = '1234567891'
        @order_sending_destination.valid?
        expect(@order_sending_destination.errors[:phone_number]).to include('は不正な値です')
      end
    end
  end
end
