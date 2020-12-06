require 'rails_helper'

RSpec.describe 'Apps', type: :request do
  before do
    @user = FactoryBot.create(:user)
    @app = FactoryBot.create(:app, user: @user)
  end
  
  describe 'トップページ' do
    before do
      get root_path
    end
    it '正常にレスポンスが返ってくることを確認' do
      expect(response.status).to eq 200
    end
    it '投稿済みのアプリの名前が存在することを確認' do
      expect(response.body).to include(@app.name)
    end
    it '投稿済みのアプリの画像が存在することを確認' do
      expect(response.body).to include "youtube.png"
    end
    it '投稿済みのアプリの説明が存在することを確認' do
      expect(response.body).to include(@app.description)
    end
    it '投稿済みのアプリのプログラミング言語が存在することを確認' do
      expect(response.body).to include(@app.language)
    end
    it '投稿済みのアプリのURLが存在することを確認' do
      expect(response.body).to include(@app.reference)
    end
    it '投稿済みのアプリの開発日数が存在することを確認' do
      expect(response.body).to include("10")
    end
    it '投稿済みのアプリを開発したユーザーの名前が存在することを確認' do
      expect(response.body).to include @user.name
    end
    it '投稿済みのアプリを開発したユーザーの名前が存在することを確認' do
      expect(response.body).to include "youtube.png"
    end
    it '検索窓が存在することを確認' do
      expect(response.body).to include "検索"
    end
    it 'アプリ一覧が存在することを確認' do
      expect(response.body).to include "アプリ一覧"
    end
  end

  describe 'アプリ詳細ページ' do
    before do
      get app_path(@app)
    end

    it '正常にレスポンスが返ってくることを確認' do
      expect(response.status).to eq 200
    end
    it '投稿済みのアプリの名前が存在することを確認' do
      expect(response.body).to include(@app.name)
    end
    it '投稿済みのアプリの画像が存在することを確認' do
      expect(response.body).to include "youtube.png"
    end
    it '投稿済みのアプリの作成者が存在することを確認' do
      expect(response.body).to include @user.name
    end
    it '投稿済みのアプリの説明が存在することを確認' do
      expect(response.body).to include(@app.description)
    end
    it '投稿済みのアプリのプログラミング言語が存在することを確認' do
      expect(response.body).to include(@app.language)
    end
    it '投稿済みのアプリのポイントが存在することを確認' do
      expect(response.body).to include(@app.point)
    end
    it '投稿済みのアプリのURLが存在することを確認' do
      expect(response.body).to include(@app.reference)
    end
    it '投稿済みのアプリの開発日数が存在することを確認' do
      expect(response.body).to include("#{@app.period}")
    end
  end
end
