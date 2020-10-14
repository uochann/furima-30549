require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品を出品' do
    context '商品を出品できる場合' do
      it 'name、introduction、price、condition、category、postage_type、preparation_day、prefecture_idがある場合出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品を出品できない場合' do
      it 'imageが空では保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors[:image]).to include('を入力してください')
      end

      it 'nameが空だと登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors[:name]).to include('を入力してください')
      end

      it 'introductionが空だと登録できない' do
        @item.introduction = nil
        @item.valid?
        expect(@item.errors[:introduction]).to include('を入力してください')
      end

      it 'priceが空だと登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors[:price]).to include('を入力してください')
      end

      it 'priceが、300円未満だと登録できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors[:price]).to include('は300以上の値にしてください')
      end

      it 'priceが、10000000円以上だと登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors[:price]).to include('は9999999より小さい値にしてください')
      end

      it '売価格は半角数字のみ保存可能であること' do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors[:price]).to include('は数値で入力してください')
      end

      it 'conditionが空だと登録できない' do
        @item.condition = nil
        @item.valid?
        expect(@item.errors[:condition]).to include('を入力してください')
      end

      it 'conditionがid.1だと登録できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors[:condition_id]).to include('は1以外の値にしてください')
      end

      it 'categoryが空だと登録できない' do
        @item.category = nil
        @item.valid?
        expect(@item.errors[:category]).to include('を入力してください')
      end

      it 'categoryがid.1だと登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors[:category_id]).to include('は1以外の値にしてください')
      end

      it 'postage_typeが空だと登録できない' do
        @item.postage_type = nil
        @item.valid?
        expect(@item.errors[:postage_type]).to include('を入力してください')
      end

      it 'postage_typeがid.1だと登録できない' do
        @item.postage_type_id = '1'
        @item.valid?
        expect(@item.errors[:postage_type_id]).to include('は1以外の値にしてください')
      end

      it 'preparation_dayが空だと登録できない' do
        @item.preparation_day = nil
        @item.valid?
        expect(@item.errors[:preparation_day]).to include('を入力してください')
      end

      it 'preparation_dayがid.1だと登録できない' do
        @item.preparation_day_id = '1'
        @item.valid?
        expect(@item.errors[:preparation_day_id]).to include('は1以外の値にしてください')
      end

      it 'prefectureが空だと登録できない' do
        @item.prefecture = nil
        @item.valid?
        expect(@item.errors[:prefecture]).to include('を入力してください')
      end

      it 'prefectureがid.1だと登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors[:prefecture_id]).to include('は1以外の値にしてください')
      end

      it 'userが紐付いていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
