require 'rails_helper'

RSpec.describe 'Favorites', type: :request do
  before do
    @user = FactoryBot.create(:user)
    @app = FactoryBot.create(:app)
  end

  context 'お気に入り登録処理' do
    # context 'ログインしている場合' do
    #   before do
    #     post new_user_session_path, params: { session: { email: @user.email,password: @user.password } }
    #   end
    #   it '投稿にブックマーク登録ができることを確認' do
    #     expect{
    #       post "/favorites/#{@app.id}/create"
    #     }.to change{Favorite.count}.by(1)
    #   end
    # end

    context 'ログインしてない場合' do
      it 'お気に入り登録はできず、ログインページへリダイレクトすることを確認' do
        expect do
          post "/favorites/#{@app.id}/create"
        end.not_to change { Favorite.count }
        expect(response).to redirect_to new_user_session_path
      end

      it 'お気に入り解除はできず、ログインページへリダイレクトすることを確認' do
        expect do
          delete "/favorites/#{@app.id}/destroy"
        end.not_to change { Favorite.count }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
