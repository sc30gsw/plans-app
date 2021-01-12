require 'rails_helper'

RSpec.describe 'Notes', type: :request do
  before do
    @note = FactoryBot.create(:note)
  end

  describe 'GET #index' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do
      get root_path
      expect(response.status).to eq 200
    end

    it 'indexアクションにリクエストするとレスポンスに投稿済みのnoteのタイトルが存在する' do
      get root_path
      expect(response.body).to include @note.title
    end

    it 'indexアクションにしクエストするとレスポンスに投稿検索フォームが存在する' do
      get root_path
      expect(response.body).to include 'キーワードを入力'
    end
  end

  describe 'GET #show' do
    it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do
      get note_path(@note)
      expect(response.status).to eq 200
    end

    it 'showアクションにリクエストするとレスポンスに投稿済みのnoteのタイトルが存在する' do
      get note_path(@note)
      expect(response.body).to include @note.title
    end

    it 'showアクションにリクエストするとレスポンスに投稿済みのnoteのテキストnが存在する' do
      get note_path(@note)
      expect(response.body).to include @note.text
    end

    it 'showアクションにリクエストするとレスポンスに投稿済みのnoteのplanが存在する' do
      get note_path(@note)
      expect(response.body).to include @note.plan
    end
  end
end