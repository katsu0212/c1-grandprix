require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @like = FactoryBot.build(:like)
  end
  describe 'いいね機能' do
    context 'いいねできる場合' do
      it 'postとuserと紐づいていればいいねできる' do
        expect(@like).to be_valid
      end
    end
    context 'いいねできない場合' do
      it 'userが紐づいていないといいねできない' do
        @like.user = nil
        @like.valid?
        expect(@like.errors.full_messages).to include("User must exist")
      end
      it 'postが紐づいていないといいねできない' do
        @like.post = nil
        @like.valid?
        expect(@like.errors.full_messages).to include("Post must exist")
      end
    end
  end
end
