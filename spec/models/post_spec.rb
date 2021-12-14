require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end
  describe '新規投稿' do
    context '新規投稿できる場合' do
      it 'imageとbodyが入力されていれば投稿できる' do
        expect(@post).to be_valid
      end
    end
    context '新規投稿できない場合' do
      it 'imageが空では投稿できない' do
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Image can't be blank")
      end
      it 'bodyが空では投稿できない' do
        @post.body = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Body can't be blank")
      end
      it 'userが紐づいていないと投稿できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("User must exist")
      end
    end
  end
end
