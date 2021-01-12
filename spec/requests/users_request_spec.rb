require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before do
    @user = FactoryBot.create(:user)
  end

  describe 'GET #show' do
    it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do
      get user_path(@user)
      expect(response.status).to eq 200
    end

    it 'showアクションにリクエストするとレスポンスにユーザーのnicknameが存在する' do
      get user_path(@user)
      expect(response.body).to include @user.nickname
    end
  end
end
