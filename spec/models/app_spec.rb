require 'rails_helper'

RSpec.describe App, type: :model do
  before do
    @app = FactoryBot.create(:app)
  end

  describe 'アプリの保存' do
    context '投稿が保存できる場合' do
      it '全て正常に保存されることを確認' do
        expect(@app).to be_valid
      end
    end
    context '投稿が保存できない場合' do
      it '画像がない場合投稿できないことを確認' do
        @app.image = nil
        @app.valid?
        binding.pry
        expect(@app.errors.full_messages).to include('')
      end
    end
  end
end
