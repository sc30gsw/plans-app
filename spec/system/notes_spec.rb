require 'rails_helper'

RSpec.describe '新規投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @note = FactoryBot.build(:note)
  end

  context 'note投稿ができるとき' do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインする
      sign_in(@user)
      # 新規投稿ページへのリンクがあることを確認する
      expect(page).to have_content('投稿する')
      # 投稿ページに移動する
      visit new_note_path
      # フォームに情報を入力する
      fill_in 'note_title', with: @note.title
      fill_in 'note_text', with: @note.text
      fill_in 'note_plan', with: @note.plan
      # 送信するとNoteモデルのカウントが1上がることを確認する
      expect do
        find('input[name="commit"]').click
      end.to change { Note.count }.by(1)
      # トップページに遷移することを確認する
      expect(current_path).to eq root_path
      # トップページには先ほど投稿した内容のnoteがあることを確認する
      expect(page).to have_content(@note.title)
    end
  end

  context 'note投稿ができないとき' do
    it 'ログインていないと新規投稿ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # 新規投稿ページへのリンクがない
      expect(page).to have_no_content('投稿する')
    end
  end
end
