require 'rails_helper'

RSpec.describe "Favorites", type: :request do
  before do
    @user = FactoryBot.create(:user)
    @app = FactoryBot.create(:app)
  end

  context 'お気に入り登録処理' do
    context 'ログインしてない場合' do
      it 'お気に入り登録はできず、ログインページへリダイレクトすることを確認' do
        expect {
          post "/favorites/#{@app.id}/create"
        }.not_to change{Favorite.count}
        expect(response).to redirect_to new_user_session_path
      end

      it 'お気に入り解除はできず、ログインページへリダイレクトすることを確認' do
        expect {
          delete "/favorites/#{@app.id}/destroy"
        }.not_to change{Favorite.count}
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
