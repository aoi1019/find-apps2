require 'rails_helper'

RSpec.describe 'Favorites', type: :request do
  before do
    @user = FactoryBot.create(:user)
    @app = FactoryBot.create(:app)
  end

  describe 'お気に入り一覧ページ' do
    context 'ログインしている場合' do
      it '正常にレスポンスが表示することを確認' do
        sign_in(@user)
        get favorites_path
        expect(response.status).to eq 200
      end
    end
    context 'ログインしてない場合' do
      it '遷移するとログインページへリダイレクトすることを確認' do
        get favorites_path
        expect(response.status).not_to eq 200
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'お気に入り登録処理' do
    context 'ログインしている場合' do
      before do
        sign_in(@user)
      end
      it '投稿にお気に入り登録ができることを確認' do
        expect{
          post "/favorites/#{@app.id}/create"
        }.to change{ Favorite.count }.by(1)
      end
      it '投稿にajaxによるお気に入り登録ができることを確認' do
        expect {
          post "/favorites/#{@app.id}/create", xhr: true
        }.to change{ Favorite.count }.by(1)
      end
      it '投稿のお気に入り解除ができることを確認' do
        @user.favorite(@app)
        expect{
          delete "/favorites/#{@app.id}/destroy"
        }.to change{ Favorite.count }.by(-1)
      end
      it '投稿にajaxによるお気に入り解除ができることを確認' do
        @user.favorite(@app)
        expect{
          delete "/favorites/#{@app.id}/destroy", xhr: true
        }.to change{ Favorite.count }.by(-1)
      end
    end
    
    context 'ログインしてない場合' do
      it 'お気に入り登録はできず、ログインページへリダイレクトすることを確認' do
        expect {
          post "/favorites/#{@app.id}/create"
        }.not_to change { Favorite.count }
        expect(response).to redirect_to new_user_session_path
      end

      it 'お気に入り解除はできず、ログインページへリダイレクトすることを確認' do
        expect {
          delete "/favorites/#{@app.id}/destroy"
        }.not_to change { Favorite.count }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
