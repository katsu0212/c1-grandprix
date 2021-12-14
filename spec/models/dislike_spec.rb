require 'rails_helper'

RSpec.describe Dislike, type: :model do
  before do
    @dislike = FactoryBot.build(:dislike)
  end
  describe 'dislike機能' do
    context 'dislikeできる場合' do
      it 'postとuserが紐づいていればdislikeできる' do
        expect(@dislike).to be_valid
      end
    end
    context 'dislikeできない場合' do
      it 'userが紐づいていないとdislikeできない' do
        @dislike.user = nil
        @dislike.valid?
        expect(@dislike.errors.full_messages).to include("User must exist")
      end
      it 'postが紐づいていないとdislikeできない' do
        @dislike.post = nil
        @dislike.valid?
        expect(@dislike.errors.full_messages).to include("Post must exist")
      end
    end
  end
end

