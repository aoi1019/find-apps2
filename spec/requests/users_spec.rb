require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before do
    @user = FactoryBot.create(:user)
  end

  describe 'ユーザー詳細ページ' do
    before do
      get user_path(@user)
    end

    it '正常にレスポンスが表示されることを確認' do
      expect(response.status).to eq 200
    end
    it 'ユーザーの名前が存在することを確認' do
      expect(response.body).to include(@user.name)
    end
    it 'ユーザーのプロフィール画像が存在することを確認' do
      expect(response.body).to include("youtube.png")
    end
    it 'ユーザーのプロフィール文が存在することを確認' do
      expect(response.body).to include(@user.profile)
    end
    it 'ユーザーのTwitterが存在することを確認' do
      expect(response.body).to include(@user.twitter)
    end
    it 'ユーザーのGitHubが存在することを確認' do
      expect(response.body).to include(@user.qiita)
    end
    it 'ユーザーの出身スクールが存在することを確認' do
      expect(response.body).to include(@user.school.name)
    end
  end

  describe 'ユーザー編集ページ' do
    context 'ログインしている場合' do
      before do
        sign_in(@user)
        get edit_user_registration_path
      end

      it '正常にレスポンスが表示することを確認' do
        expect(response.status).to eq 200
      end
      it 'タイトル「プロフィール編集」を確認' do
        expect(response.body).to include('プロフィール編集')
      end
      it '名前ラベルが表示されることを確認' do
        expect(response.body).to include('名前')
      end
      it '名前が表示されることを確認' do
        expect(response.body).to include(@user.name)
      end
      it 'プロフィール画像が表示されることを確認' do
        expect(response.body).to include('プロフィール画像')
      end
      it '自己紹介文が表示されることを確認' do
        expect(response.body).to include('自己紹介文')
      end
      it 'Twitterアカウントが表示されることを確認' do
        expect(response.body).to include('Twitterアカウント')
      end
      it 'GitHubアカウントが表示されることを確認' do
        expect(response.body).to include('GitHubアカウント')
      end
      it '通っているスクールが表示されることを確認' do
        expect(response.body).to include('通っているスクール')
      end
      it '更新が表示されることを確認' do
        expect(response.body).to include('更新')
      end

    end
    context 'ログインしていない場合' do
      it 'ページ遷移すると、ログインページへリダイレクトすることを確認' do
        get edit_user_registration_path
        expect(response.status).not_to eq 200
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
