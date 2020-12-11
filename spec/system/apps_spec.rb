require 'rails_helper'

RSpec.describe "Apps", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @app = FactoryBot.create(:app)
  end
  context '新規投稿ができるとき' do
    it 'ログインしたユーザーは投稿できる' do
      #ログインする
      sign_in_system(@user)
      #投稿するボタンがあることをかくにん
      expect(page).to have_content('新規投稿')
      #新規投稿画面に遷移
      visit new_app_path
      #フォームに入力する
      fill_in "app-text", with: @app.name
      attach_file "app-image", "public/images/youtube.png"
      fill_in "app-description", with: @app.description
      fill_in "app-language", with: @app.language
      fill_in "app-point", with: @app.point
      fill_in "app-reference", with: @app.reference
      fill_in "app-period", with: @app.period
      #カウントが上がることを確認
      expect {
        find('input[name="commit"]').click
      }.to change{ App.count }.by(1)
      #トップページに遷移することを確認
      expect(current_path).to eq root_path
      #投稿完了の文字があることを確認
      expect(page).to have_content('投稿が完了しました！')
      #トップページに先ほど投稿した内容があることを確認
      expect(page).to have_content(@app.name)
      expect(page).to have_content(@app.description)
      expect(page).to have_content(@app.reference)
      expect(page).to have_content(@app.period)
    end
  end
end
