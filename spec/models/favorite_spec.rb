require 'rails_helper'

RSpec.describe Favorite, type: :model do
  before do
    @favorite = FactoryBot.build(:favorite)
  end

  it 'favoriteインスタンスが有効であることを確認' do
    expect(@favorite).to be_valid
  end

  it 'user_idがnilの場合、無効であることを確認' do
    @favorite.user = nil
    expect(@favorite).not_to be_valid
  end

  it 'app_idがnilの場合、無効であることを確認' do
    @favorite.app = nil
    expect(@favorite).not_to be_valid
  end
end
