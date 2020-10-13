require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it 'nickname、email、bithday、first_name、last_name、first_name_kana、last_name_kana、password、password_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameがない場合は登録できないこと' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors[:nickname]).to include('を入力してください')
      end

      it 'emailがない場合は登録できないこと' do
        @user.email = nil
        @user.valid?
        expect(@user.errors[:email]).to include('を入力してください')
      end

      it 'emailに@が含まれていないと登録できないこと' do
        @user.email = 'test.test.com'
        @user.valid?
        expect(@user.errors[:email]).to include('は不正な値です')
      end

      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Emailはすでに存在します')
      end

      it 'passwordが半角英字のみだと登録できない' do
        @user.password = 'aiueok'
        @user.password_confirmation = 'aiueok'
        @user.valid?
        expect(@user.errors.full_messages).to include('Passwordは不正な値です')
      end

      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Passwordは不正な値です')
      end

      it 'passwordが6文字以下であれば登録できないこと' do
        @user.password = '12k56'
        @user.valid?
        expect(@user.errors[:password]).to include('は6文字以上で入力してください')
      end

      it 'passwordが確認用含めて二回入力されていないと登録できない' do
        @user.password = 'tanaka00'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include('とPasswordの入力が一致しません')
      end

      it 'last_nameが空だと登録できない' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors[:last_name]).to include('を入力してください')
      end

      it 'first_nameが空だと登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors[:first_name]).to include('を入力してください')
      end

      it 'last_nameが全角入力出なければ登録できない' do
        @user.last_name = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors[:last_name]).to include('は不正な値です')
      end

      it 'first_nameが全角入力出なければ登録できない' do
        @user.first_name = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors[:first_name]).to include('は不正な値です')
      end

      it 'last_name_kanaが空だと登録できない' do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors[:last_name_kana]).to include('を入力してください')
      end

      it 'first_name_kanaが空だと登録できない' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors[:first_name_kana]).to include('を入力してください')
      end

      it 'first_name_kanaが全角カタカナでなければ登録できないこと' do
        @user.first_name_kana = 'あいうえお'
        @user.valid?
        expect(@user.errors[:first_name_kana]).to include('は不正な値です')
      end

      it 'last_name_kanaが全角カタカナでなければ登録できないこと' do
        @user.last_name_kana = 'あいうえお'
        @user.valid?
        expect(@user.errors[:last_name_kana]).to include('は不正な値です')
      end

      it '誕生日が空だと登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors[:birthday]).to include('を入力してください')
      end
    end
  end
end
