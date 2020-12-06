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
end
