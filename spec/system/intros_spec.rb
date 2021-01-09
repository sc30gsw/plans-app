require 'rails_helper'

RSpec.describe "intro新規登録", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @intro = FactoryBot.build(:intro)
  end

  context '新規登録ができるとき' do
    it '新規登録したユーザーはプロフィールの新規登録ができる' do
      # 新規登録する
      sign_in(@user)
      # ユーザー詳細に遷移するアイコンがある
      expect(page).to have_selector '.index-icon'
      # ユーザー詳細に遷移する
      visit user_path(@user.id)
      # プロフィール情報を入力するボタンがある
      expect(page).to have_content 'プロフィールを編集する'
      # プロフィール新規登録ページに移動する
      visit new_intro_path
      # 添付する画像を定義する
      image_path = Rails.root.join('public/images/test_image.png')
      # ユーザー情報を入力する
      fill_in 'firstname', with: @intro.first_name
      fill_in 'lastname', with: @intro.last_name
      fill_in 'website', with: @intro.website
      fill_in 'profile', with: @intro.profile
      # 画像選択フォームに画像を添付する
      attach_file("intro[image]",image_path, make_visible: true)
      # 送信するとIntroモデルのカウントが1上がる
      expect{
        find('input[name="commit"]').click
      }.to change{Intro.count}.by(1)
      # 詳細ページに遷移することを確認する
      expect(current_path).to eq user_path(@user.id)
      # 詳細ページには先ほど入力した内容のプロフィールが存在することを確認する(画像)
      expect(page).to have_selector '.intro-icon'
      # 詳細ページには先ほど入力した内容のプロフィールが存在することを確認する(テキスト)
      expect(page).to have_content @intro.first_name
      expect(page).to have_content @intro.last_name
      expect(page).to have_content @intro.website
      expect(page).to have_content @intro.profile
    end
  end
end
