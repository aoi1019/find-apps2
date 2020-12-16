require 'rails_helper'

RSpec.describe 'Likes', type: :request do
  before do
    @user = FactoryBot.create(:user)
    @app = FactoryBot.create(:app)
  end
  describe 'いいね登録' do
    context 'ログインしている場合' do
      before do
        sign_in(@user)
      end
      it 'いいねできることを確認' do
        expect do
          post "/likes/#{@app.id}/create"
        end.to change { Like.count }.by(1)
      end
      it 'Ajaxによるいいねできることを確認' do
        expect do
          post "/likes/#{@app.id}/create", xhr: true
        end.to change { Like.count }.by(1)
      end
      it 'いいね解除できることを確認' do
        @user.like(@app)
        expect do
          delete "/likes/#{@app.id}/destroy"
        end.to change { Like.count }.by(-1)
      end
      it 'Ajaxによるいいね解除できることを確認' do
        @user.like(@app)
        expect do
          delete "/likes/#{@app.id}/destroy", xhr: true
        end.to change { Like.count }.by(-1)
      end
    end

    context 'ログインしてない場合' do
      it 'いいねできないことを確認' do
        expect do
          post "/likes/#{@app.id}/create"
        end.not_to change { Like.count }
      end
      it 'いいね解除できないことを確認' do
        expect do
          delete "/likes/#{@app.id}/destroy"
        end.not_to change { Like.count }
      end
    end
  end
end
