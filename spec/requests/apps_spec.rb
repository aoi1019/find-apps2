require 'rails_helper'

RSpec.describe 'Apps', type: :request do
  before do
    @user = FactoryBot.create(:user)
    @app = FactoryBot.create(:app, user: @user)
  end
  
  describe 'トップページ' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくることを確認' do
      get root_path
      expect(response.status).to eq 200
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みのアプリの名前が存在することを確認' do
      get root_path
      expect(response.body).to include(@app.name)
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みのアプリの画像が存在することを確認' do
      get root_path
      expect(response.body).to include "youtube.png"
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みのアプリの説明が存在することを確認' do
      get root_path
      expect(response.body).to include(@app.description)
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みのアプリのプログラミング言語が存在することを確認' do
      get root_path
      expect(response.body).to include(@app.language)
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みのアプリのURLが存在することを確認' do
      get root_path
      expect(response.body).to include(@app.reference)
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みのアプリの開発日数が存在することを確認' do
      get root_path
      expect(response.body).to include("10")
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みのアプリを開発したユーザーの名前が存在することを確認' do
      get root_path
      expect(response.body).to include @user.name
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みのアプリを開発したユーザーの名前が存在することを確認' do
      get root_path
      expect(response.body).to include "youtube.png"
    end
    it 'indexアクションにリクエストすると検索窓が存在することを確認' do
      get root_path
      expect(response.body).to include "検索"
    end
    it 'indexアクションにリクエストするとアプリ一覧が存在することを確認' do
      get root_path
      expect(response.body).to include "アプリ一覧"
    end
  end
end
