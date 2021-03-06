require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it '正常に登録ができることを確認' do
        expect(@user).to be_valid
      end
      it 'パスワードが6文字以上で登録できる' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかない時' do
      it 'nameが空だと登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名前を入力してください')
      end
      it 'nameが20文字以上だと登録できない' do
        @user.name = 'a' * 21
        @user.valid?
        expect(@user.errors.full_messages).to include('名前は20文字以内で入力してください')
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end
      it 'passwordが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'passwordが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'school_idが1では登録できない' do
        @user.school_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include('スクールは1以外の値にしてください')
      end
      it 'profileが200文字以上では登録できない' do
        @user.profile = 'a' * 201
        @user.valid?
        expect(@user.errors.full_messages).to include('プロフィールは200文字以内で入力してください')
      end
    end
  end
end
