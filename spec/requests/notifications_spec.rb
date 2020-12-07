require 'rails_helper'

RSpec.describe 'Notifications', type: :request do
  before do
    @user = FactoryBot.create(:user)
  end
  describe '通知一覧ページ' do
    context 'ログインしている場合' do
      it '正常にレスポンスが表示することを確認' do
        sign_in(@user)
        get notifications_path
        expect(response.status).to eq 200
      end
    end
    context 'ログインしていない場合' do
      it '遷移するとログインページへリダイレクトすることを確認' do
        get notifications_path
        expect(response.status).not_to eq 200
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
