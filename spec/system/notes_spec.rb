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
      # 添付する画像を定義する
      image_path = Rails.root.join('public/images/test_image.png')
      # 画像選択フォームに画像を添付する
      attach_file('note[image]',image_path,make_visible: true)
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

RSpec.describe '投稿詳細', type: :system do
  before do
    @note = FactoryBot.create(:note)
    @user = FactoryBot.create(:user)
  end
  it 'ログインしたユーザーはnote詳細ページに遷移してコメント投稿欄が表示される' do
    # ログインする
    sign_in(@user)
    # 投稿のタイトルリンクがあることを確認する
    expect(page).to have_content (@note.title)
    # 詳細ページに遷移する
    visit note_path(@note)
    # 詳細ページに投稿内容が含まれている
    expect(page).to have_content(@note.title)
    expect(page).to have_content(@note.text)
    expect(page).to have_content(@note.plan)
    expect(page).to have_selector ".show-note-image"
    # コメント用フォームが存在する
    expect(page).to have_selector ".comment-textarea"

  end

  it 'ログインしていな状態ではnote詳細ページに遷移できるもののコメント入力欄が表示されない' do
    # トップページに移動する
    visit root_path
    # 投稿のタイトルリンクがあることを確認する
    expect(page).to have_content(@note.title)
    # 詳細ページに遷移する
    visit note_path(@note)
    # 詳細ページに投稿内容が含まれている
    expect(page).to have_content(@note.title)
    expect(page).to have_content(@note.text)
    expect(page).to have_content(@note.plan)
    expect(page).to have_selector ".show-note-image"
    # コメントフォームが存在しないことを確認する
    expect(page).to have_no_selector ".comment-textarea"
  end
end