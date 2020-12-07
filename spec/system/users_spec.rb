require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context '新規登録できるとき' do
    it '正しい情報を入力すれば新規登録ができてトップページに移動する' do
      #トップページに移動
      visit root_path
      #トップページに新規登録リンクがあることを確認
      expect(page).to have_content('新規登録')
      #新規登録ページへ移動する
      visit new_user_registration_path
      #ユーザー情報を入力する
      fill_in 'nickname', with: @user.name
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      fill_in 'password-confirmation', with: @user.password_confirmation
      #新規登録ボタンをクリック
      expect {
        find('input[name="commit"]').click
      }.to change{ User.count }.by(1)
      #トップページに遷移したことを確認
      expect(current_path).to eq root_path
      #ログアウトボタンを確認
      # expect(
      #   find(".dropdown").find(".dropdown-toggle").hover
      # ).to have_content(' ログアウト')
      #新規登録・ログインリンクがないことを確認
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end

  context '新規登録ができない時' do
    it '誤った情報では新規登録ができずに新規登録ページへ戻ってくる' do
      #トップページに移動する
      visit root_path
      #トップページに新規登録リンクがあることを確認
      expect(page).to have_content('新規登録')
      #新規登録ページへ移動する
      visit new_user_registration_path
      #ユーザー情報を入力する
      fill_in 'nickname', with: ""
      fill_in 'email', with: ""
      fill_in 'password', with: ""
      fill_in 'password-confirmation', with: ""
      #新規登録ボタンを押してもカウントが上がらないことを確認
      expect {
        find('input[name="commit"]').click
      }.not_to change{ User.count }
      #新規登録ページに戻されることを確認
      expect(current_path).to eq '/users'
    end
  end

  context 'ログインできるとき' do
    before do
      @user = FactoryBot.create(:user)
    end
    it '保存されているユーザーの情報と合致すればログインできる' do
      #トップページに移動する
      visit root_path
      #ログインボタンがあることを確認
      expect(page).to have_content('ログイン')
      #ログインページへ遷移する
      visit new_user_session_path
      #ユーザー情報を入力
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      #ログインボタンをクリック
      find('input[name="commit"]').click
      #トップページに遷移したことを確認
      expect(current_path).to eq root_path
      #新規登録・ログインリンクが表示されていないことを確認
      expect(page).to have_no_content('新規登録')
    end
    it '保存されているユーザーの情報と合致しないとログインできない' do
      #トップページに移動する
      visit root_path
      #ログインボタンがあることを確認
      expect(page).to have_content('ログイン')
      #ログインページへ遷移する
      visit new_user_session_path
      #ユーザー情報を入力
      fill_in 'email', with:""
      fill_in 'password', with: ""
      #ログインボタンをクリック
      find('input[name="commit"]').click
      #ログインページに戻ることを確認
      expect(current_path).to eq new_user_session_path
    end
  end

end
