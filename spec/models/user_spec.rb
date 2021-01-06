require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'すべての項目が存在すれば登録できる' do
        
      end
    end
    context '新規登録がうまく行かないとき' do
      it 'nicknameが空だと登録できない' do
        
      end
      
      it 'nicknameが3文字以下だと登録できない' do
        
      end

      it 'nicknameが16文字以上だと登録できない' do
        
      end
      
      it 'nicknameが全角かな/カナ/漢字だと登録できない' do
        
      end
      
      it 'emialが空だと登録できない' do
        
      end

      it 'emailが重複していると登録できない' do
        
      end

      it 'emailに@を含んでいなければ登録できない' do
        
      end

      it 'passwordが空だと登録できない' do
        
      end

      it 'passwordが7文字以下だと登録できない' do
        
      end

      it 'passwordとpassword_confirmationが一致しないと登録できない' do
        
      end

      it 'passwordが英語のみだと登録できない' do
        
      end
    end
  end
end
