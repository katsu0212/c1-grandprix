require 'rails_helper'

RSpec.describe Title, type: :model do
  before do
    @title = FactoryBot.build(:title)
  end
  describe '新規投稿' do
    context '新規投稿できる場合' do
      it 'titleとtheme_idが入力されていれば投稿できる' do
        expect(@title).to be_valid
      end
    end
    context '新規投稿できない場合' do
      it 'titleが空では投稿できない' do
        @title.content = nil
        @title.valid?
        expect(@title.errors.full_messages).to include("Content can't be blank")
      end
      it 'title_idが空では投稿できない' do
        @title.theme_id = nil
        @title.valid?
        expect(@title.errors.full_messages).to include("Theme can't be blank")
      end
      it 'title_idが1では投稿できない' do
        @title.theme_id = 1
        @title.valid?
        expect(@title.errors.full_messages).to include("Theme can't be blank")
      end
    end
  end
end
