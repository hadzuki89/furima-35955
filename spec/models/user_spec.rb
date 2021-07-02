require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    it 'nameが空だと登録できない' do
      @user.name = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include "Name can't be blank"
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it 'passwordが英語のみでは登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'passwordが数字のみでは登録できない' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'last_nameが空だと登録できない' do
      @user.last_name = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end

    it 'last_nameが全角（漢字・ひらがな・カタカナ）以外だと登録できない' do
      @user.last_name = 'aaa000'  
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name is invalid"
    end

    it 'first_nameが空だと登録できない' do
      @user.first_name = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end

    it 'first_nameが全角（漢字・ひらがな・カタカナ）以外だと登録できない' do
      @user.first_name = 'aaa000'  
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid"
    end

    it 'last_name_kanaが空だと登録できない' do
      @user.last_name_kana = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
    end

    it 'last_name_kanaがカタカナ以外だと登録できない' do
      @user.last_name_kana = 'ひらがな漢字１a'  
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana is invalid"
    end

    it 'first_name_kanaが空だと登録できない' do
      @user.first_name_kana = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end

    it 'first_name_kanaがカタカナ以外だと登録できない' do
      @user.first_name_kana = 'ひらがな漢字１a'  
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana is invalid"
    end

    it 'birth_dayが空だと登録できない' do
      @user.birth_day = ''  
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth day can't be blank"
    end
  end
end
