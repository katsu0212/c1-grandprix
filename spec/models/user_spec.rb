require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'email,username,password,password_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it '名前が空では登録できない' do
        @user.user_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("User name can't be blank")
      end

      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'emailに@が入っていないと登録できない' do
        @user.email = 'cat.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが6文字以下だと登録できない' do
        @user.password = 'abc12'
        @user.password_confirmation = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'passwordは英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation ='aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end 
      it 'passwordは数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation ='123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end 
      it '全角文字を含むpasswordは登録できない' do
        @user.password = 'アイウ1234'
        @user.password_confirmation ='アイウ1234'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end 

      it 'passwordとpassword_confirmationの値が一致しないと登録できない' do
        @user.password_confirmation = 'dog1111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
