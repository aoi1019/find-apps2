require 'rails_helper'

RSpec.describe 'アプリ投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @app = FactoryBot.create(:app)
  end
  context '新規投稿ができるとき' do
    it 'ログインしたユーザーは投稿できる' do
      # ログインする
      sign_in_system(@user)
      # 投稿するボタンがあることをかくにん
      expect(page).to have_content('新規投稿')
      # 新規投稿画面に遷移
      visit new_app_path
      # フォームに入力する
      fill_in 'app-text', with: @app.name
      attach_file 'app-image', 'public/images/youtube.png'
      fill_in 'app-description', with: @app.description
      fill_in 'app-language', with: @app.language
      fill_in 'app-point', with: @app.point
      fill_in 'app-reference', with: @app.reference
      fill_in 'app-period', with: @app.period
      # カウントが上がることを確認
      expect do
        find('input[name="commit"]').click
      end.to change { App.count }.by(1)
      # トップページに遷移することを確認
      expect(current_path).to eq root_path
      # 投稿完了の文字があることを確認
      expect(page).to have_content('投稿が完了しました！')
      # トップページに先ほど投稿した内容があることを確認
      expect(page).to have_content(@app.name)
      expect(page).to have_content(@app.description)
      expect(page).to have_content(@app.reference)
      expect(page).to have_content(@app.period)
    end
  end
  context '新規投稿ができないとき' do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # トップページに遷移
      visit root_path
      # 投稿ページのリンクがないことを確認
      expect(page).not_to have_content('新規投稿')
    end
  end
end

RSpec.describe 'アプリ編集', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @app1 = FactoryBot.create(:app, user: @user)
    @app2 = FactoryBot.create(:app)
  end
  context 'アプリ編集ができることを確認' do
    it 'ログインしたユーザーは自分が投稿したツイートの編集ができる' do
      # 投稿したユーザーでログインする
      sign_in_system(@user)
      # アプリ詳細ページに移動
      visit app_path(@app1)
      # app1に編集ボタンがあることを確認
      expect(page).to have_link('アプリの編集'), href: edit_app_path(@app1)
      # アプリ編集ページに遷移できる
      visit edit_app_path(@app1)
      # すでに投稿の内容が反映されていることを確認
      expect(
        find('#app-text').value
      ).to eq @app1.name
      expect(
        find('#app-description').value
      ).to eq @app1.description
      expect(
        find('#app-point').value
      ).to eq @app1.point
      expect(
        find('#app-reference').value
      ).to eq @app1.reference
      expect(
        find('#app-language').value
      ).to eq @app1.language
      expect(
        find('#app-period').value
      ).to eq '10'
      # アプリ編集する
      fill_in 'app-text', with: "#{@app1.name}あ"
      fill_in 'app-description', with: @app1.description
      fill_in 'app-language', with: @app1.language
      fill_in 'app-point', with: @app1.point
      fill_in 'app-reference', with: @app1.reference
      fill_in 'app-period', with: @app1.period
      # 編集してもカウントは変わらない
      expect do
        find('input[name="commit"]').click
      end.not_to change { App.count }
      # トップページに遷移することを確認
      expect(current_path).to eq root_path
      # 編集した内容を確認
      expect(page).to have_content("#{@app1.name}あ")
    end
  end

  context 'アプリ編集ができないとき' do
    it 'ログインしたユーザーは自分が開発したアプリ以外は編集できない' do
      # ログインする
      sign_in_system(@user)
      # アプリ２に移動
      visit app_path(@app2)
      # アプリ2に編集ボタンがないことを確認
      expect(page).to have_no_link('アプリを編集'), href: edit_app_path(@app2)
    end
    it 'ログインしていないと編集ページには遷移できない' do
      # アプリ１に遷移
      visit app_path(@app1)
      # アプリ編集ボタンがないことを確認
      expect(page).to have_no_link('アプリの編集')
    end
  end
end

RSpec.describe 'アプリ削除', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
    @app1 = FactoryBot.create(:app, user: @user)
    @app2 = FactoryBot.create(:app, user: @user2)
  end
  context 'アプリ削除できるとき' do
    it 'ログインしたユーザーは自分のアプリを削除できる' do
      # ログインする
      sign_in_system(@user)
      # アプリ詳細ページに遷移
      visit app_path(@app1)
      # アプリの削除ボタンがあることを確認
      expect(page).to have_link('アプリの削除')
      # アプリが削除できることを確認
      click_on 'アプリの削除'
      page.driver.browser.switch_to.alert.accept
      # トップページに遷移することを確認
      expect(current_path).to eq root_path
      # アプリが削除されましたと言うフラッシュメッセージを確認
      expect(page).to have_content('削除が完了しました！')
    end
  end
  context 'アプリ削除できないとき' do
    it '自分のアプリでなければ削除できない' do
      # ログインする
      sign_in_system(@user)
      # アプリ2詳細ページに遷移する
      visit app_path(@app2)
      # アプリ編集ボタンがないことを確認
      expect(page).to have_no_link('アプリの編集')
    end
    it 'ログインしないと削除できない' do
      # アプリ詳細ページに遷移
      visit app_path(@app1)
      # アプリ編集ボタンがないことを確認
      expect(page).to have_no_link('アプリの編集')
    end
  end
end

RSpec.describe 'アプリ詳細', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @app = FactoryBot.create(:app)
  end
  it 'ログインしたユーザーはアプリ詳細ページに遷移してコメント投稿欄が表示される' do
    # ログインする
    sign_in_system(@user)
    visit root_path
    # アプリ詳細ページに遷移
    visit app_path(@app)
    # 詳細ページにアプリの内容が含まれている
    expect(page).to have_content(@app.name)
    expect(page).to have_content(@app.description)
    expect(page).to have_content(@app.point)
    expect(page).to have_content(@app.period)
    expect(page).to have_content(@app.language)
    expect(page).to have_content(@app.reference)
    # コメント用のフォームが存在する
    expect(page).to have_selector('.post_review_container')
  end
  it 'ログインしていない状態でアプリ詳細ページに遷移はできるが、コメント投稿欄は表示されない' do
    # トップページに遷移
    visit root_path
    # アプリ詳細ページに遷移
    visit app_path(@app)
    # 詳細ページにアプリの内容が含まれている
    expect(page).to have_content(@app.name)
    expect(page).to have_content(@app.description)
    expect(page).to have_content(@app.point)
    expect(page).to have_content(@app.period)
    expect(page).to have_content(@app.language)
    expect(page).to have_content(@app.reference)
    # コメント用のフォームが存在する
    expect(page).to have_no_selector('.post_review_container')
  end
end
