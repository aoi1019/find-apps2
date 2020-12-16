require 'rails_helper'

RSpec.describe 'Comments', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @app = FactoryBot.create(:app)
    @comment = FactoryBot.create(:comment)
  end
  it 'ログインしたユーザーはアプリ詳細ページでコメント投稿ができる' do
    # ログインする
    sign_in_system(@user)
    # アプリ詳細ページに遷移する
    visit app_path(@app)
    # コメント投稿欄にcontentを入力する
    fill_in 'comment_content', with: @comment.content
    # コメントするとカウントが上がる
    expect  do
      find('input[name="commit"]').click
    end.to change { Comment.count }.by(1)
    # アプリ詳細ページにリダイレクトすることを確認
    visit app_path(@app)
    # アプリ詳細ページに先ほど投稿したコメントが表示されていることを確認
    expect(page).to have_content(@comment.content)
  end
  it 'ログインしていないとコメント投稿蘭が表示されないことを確認' do
    # アプリ詳細ページに遷移する
    visit app_path(@app)
    # アプリ詳細ページにコメント投稿蘭が表示されないことを確認
    expect(page).to have_no_selector('.comment_content')
  end
end
