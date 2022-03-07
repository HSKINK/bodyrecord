require 'rails_helper'

RSpec.describe Nutrient, type: :model do
  before do
    @nutrient = FactoryBot.build(:nutrient)
  end

  describe '3大栄養素バランス' do
    context '登録できるとき' do
      it '各項目に正しく入力がなされているなら登録できる' do
        expect(@nutrient).to be_valid
      end
    end
    # context '新規登録できないとき' do
    #   it 'nameが空では登録できない' do
    #     @user.name = ''
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include("Name can't be blank")
    #   end

    #   it 'emailが空では登録できない' do
    #     @user.email = ''
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include "Email can't be blank"
    #   end
    #   it '重複したemailが存在する場合登録できない' do
    #     @user.save
    #     another_user = FactoryBot.build(:user)
    #     another_user.email = @user.email
    #     another_user.valid?
    #     expect(another_user.errors.full_messages).to include 'Email has already been taken'
    #   end
    #   it 'emailに@が無いと登録できない' do
    #     @user.email = 'testtest.com'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include 'Email is invalid'
    #   end

    #   it 'passwordが空では登録できない' do
    #     @user.password = ''
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include "Password can't be blank"
    #   end
    #   it 'passwordが英字のみでは登録できない' do
    #     @user.password = 'abcdef'
    #     @user.password_confirmation = 'abcdef'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include 'Password is invalid. Input full-width characters'
    #   end
    #   it 'passwordが数字のみでは登録できない' do
    #     @user.password = '123456'
    #     @user.password_confirmation = '123456'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include 'Password is invalid. Input full-width characters'
    #   end
    #   it 'passwordが全角文字を含んでは登録できない' do
    #     @user.password = 'abc12あ'
    #     @user.password_confirmation = 'abc12あ'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include 'Password is invalid. Input full-width characters'
    #   end
    #   it 'password5文字以下では登録できない' do
    #     @user.password = 'aaaaa'
    #     @user.password_confirmation = 'aaaaa'
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
    #   end
    #   it 'passwordとpassword_confirmationが不一致では登録できない' do
    #     @user.password_confirmation = ''
    #     @user.valid?
    #     expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    #   end
    # end
  end
end
