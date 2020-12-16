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
      expect(response.body).to include 'youtube.png'
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
      expect(response.body).to include('10')
    end
    it '投稿済みのアプリを開発したユーザーの名前が存在することを確認' do
      expect(response.body).to include @user.name
    end
    it '投稿済みのアプリを開発したユーザーの名前が存在することを確認' do
      expect(response.body).to include 'youtube.png'
    end
    it '検索窓が存在することを確認' do
      expect(response.body).to include '検索'
    end
    it 'アプリ一覧が存在することを確認' do
      expect(response.body).to include 'アプリ一覧'
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
      expect(response.body).to include 'youtube.png'
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
      expect(response.body).to include(@app.period.to_s)
    end
  end

  describe '新規投稿ページ' do
    context 'ログインしてない場合' do
      it '新規投稿ページに遷移できず、トップページにリダイレクトすることを確認' do
        get new_app_path
        expect(response.status).not_to eq 200
      end
    end
    context 'ログインしている場合' do
      before do
        sign_in(@user)
        get new_app_path
      end
      it 'アプリ名の入力ラベルが表示されることを確認' do
        expect(response.body).to include('アプリ名')
      end
      it '画像の入力ラベルが表示されることを確認' do
        expect(response.body).to include('画像')
      end
      it '説明の入力ラベルが表示されることを確認' do
        expect(response.body).to include('説明')
      end
      it 'プログラミング言語の入力ラベルが表示されることを確認' do
        expect(response.body).to include('プログラミング言語')
      end
      it '技術的なポイントの入力ラベルが表示されることを確認' do
        expect(response.body).to include('技術的なポイント')
      end
      it 'アプリのURLの入力ラベルが表示されることを確認' do
        expect(response.body).to include('アプリのURL')
      end
      it '開発日数（日）の入力ラベルが表示されることを確認' do
        expect(response.body).to include('開発日数（日）')
      end
      it '投稿するボタンが表示されることを確認' do
        expect(response.body).to include('投稿')
      end
    end
  end

  describe 'アプリ編集ページ' do
    context 'ログインしてない場合' do
      it '新規投稿ページに遷移できず、トップページにリダイレクトすることを確認' do
        get new_app_path
        expect(response.status).not_to eq 200
      end
    end
    context 'ログインしている場合' do
      before do
        sign_in(@user)
        get edit_app_path(@app)
      end
      it 'アプリ名の入力ラベルが表示されることを確認' do
        expect(response.body).to include('アプリ名')
      end
      it '画像の入力ラベルが表示されることを確認' do
        expect(response.body).to include('画像')
      end
      it '説明の入力ラベルが表示されることを確認' do
        expect(response.body).to include('説明')
      end
      it 'プログラミング言語の入力ラベルが表示されることを確認' do
        expect(response.body).to include('プログラミング言語')
      end
      it '技術的なポイントの入力ラベルが表示されることを確認' do
        expect(response.body).to include('技術的なポイント')
      end
      it 'アプリのURLの入力ラベルが表示されることを確認' do
        expect(response.body).to include('アプリのURL')
      end
      it '開発日数（日）の入力ラベルが表示されることを確認' do
        expect(response.body).to include('開発日数（日）')
      end
      it '投稿するボタンが表示されることを確認' do
        expect(response.body).to include('投稿')
      end
    end
  end
end
