require 'rails_helper'

RSpec.describe Form, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    # binding.pry
    @form = FactoryBot.build(:form, user_id: user.id, item_id: item.id)
    sleep 1
  end

  describe '商品購入' do
    context '商品購入できないとき' do
      it 'postal_codeが空だと登録できない' do
        @form.postal_code = ''
        @form.valid?
        expect(@form.errors.full_messages).to include "Postal code can't be blank"
      end

      it 'postal_codeが全角では登録できない' do
        @form.postal_code = '１２３ー４５６７'
        @form.valid?
        expect(@form.errors.full_messages).to include 'Postal code is invalid'
      end

      it 'postal_codeが半角数字とハイフン以外では登録できない' do
        @form.postal_code = 'あア、。１２漢字'
        @form.valid?
        expect(@form.errors.full_messages).to include 'Postal code is invalid'
      end

      it 'postal_codeがハイフンなしでは登録できない' do
        @form.postal_code = '1234567'
        @form.valid?
        expect(@form.errors.full_messages).to include 'Postal code is invalid'
      end

      it 'area_idが空では登録できない' do
        @form.area_id = ''
        @form.valid?
        expect(@form.errors.full_messages).to include 'Area is not a number'
      end

      it 'area_idが1だと出品できない' do
        @form.area_id = 1
        @form.valid?
        expect(@form.errors.full_messages).to include 'Area must be other than 1'
      end

      it 'cityが空は登録できない' do
        @form.city = ''
        @form.valid?
        expect(@form.errors.full_messages).to include "City can't be blank"
      end

      it 'house_numberが空では登録できない' do
        @form.house_number = ''
        @form.valid?
        expect(@form.errors.full_messages).to include "House number can't be blank"
      end

      it 'numberが空では登録できない' do
        @form.number = ''
        @form.valid?
        expect(@form.errors.full_messages).to include "Number can't be blank"
      end

      it 'numberは10桁以上11桁以内の半角数値でないと登録できない' do
        @form.number = '１あー1'
        @form.valid?
        expect(@form.errors.full_messages).to include 'Number is invalid'
      end

      it 'numberが9桁以下では登録できない' do
        @form.number = '111111111'
        @form.valid?
        expect(@form.errors.full_messages).to include 'Number is invalid'
      end

      it 'numberが12桁以上では登録できない' do
        @form.number = '111111111111'
        @form.valid?
        expect(@form.errors.full_messages).to include 'Number is invalid'
      end

      it 'numberが全角では登録できない' do
        @form.number = '１１１１１１１１１１'
        @form.valid?
        expect(@form.errors.full_messages).to include 'Number is invalid'
      end

      it 'numberが数字以外では登録できない' do
        @form.number = 'あア漢字'
        @form.valid?
        expect(@form.errors.full_messages).to include 'Number is invalid'
      end

      it 'tokenが空では登録できないこと' do
        @form.token = nil
        @form.valid?
        expect(@form.errors.full_messages).to include "Token can't be blank"
      end
    end
    context '商品購入できるとき' do
      it 'postal_codeとarea_id、city、house_number、number、tokenが存在すれば登録できること' do
        expect(@form).to be_valid
      end
    end
  end
end
