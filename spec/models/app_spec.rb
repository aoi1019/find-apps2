require 'rails_helper'

RSpec.describe App, type: :model do
  before do
    @app = FactoryBot.build(:app)
  end

  describe 'アプリの保存' do
    context '投稿が保存できる場合' do
      it '全て正常に保存されることを確認' do
        expect(@app).to be_valid
      end
      it 'descriptionがなくても保存されることを確認' do
        @app.description = nil
        expect(@app).to be_valid
      end
      it 'pointがなくても保存されることを確認' do
        @app.point = nil
        expect(@app).to be_valid
      end
      it 'periodがなくても保存されることを確認' do
        @app.period = nil
        expect(@app).to be_valid
      end
    end
    context '投稿が保存できない場合' do
      it 'アプリ名がない場合投稿できないことを確認' do
        @app.name = nil
        @app.valid?
        expect(@app.errors.full_messages).to include('アプリ名を入力してください')
      end
      it '画像がない場合投稿できないことを確認' do
        @app.image = nil
        @app.valid?
        expect(@app.errors.full_messages).to include('画像を入力してください')
      end
      it 'プログラミング言語がない場合投稿できないことを確認' do
        @app.language = nil
        @app.valid?
        expect(@app.errors.full_messages).to include('プログラミング言語を入力してください')
      end
      it 'referenceがない場合投稿できないことを確認' do
        @app.reference = nil
        @app.valid?
        expect(@app.errors.full_messages).to include('アプリのURLを入力してください')
      end
    end
  end
end
