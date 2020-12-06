require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @like = FactoryBot.build(:like)
  end
  it 'Likeインスタンスが有効であることを確認' do
    expect(@like).to be_valid
  end
  it 'user_idがnilの場合、無効であることを確認' do
    @like.user = nil
    expect(@like).not_to be_valid
  end
  it 'app_idがnilの場合、無効であることを確認' do
    @like.app = nil
    expect(@like).not_to be_valid
  end
end
