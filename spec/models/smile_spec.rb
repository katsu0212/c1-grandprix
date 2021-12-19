require 'rails_helper'

RSpec.describe Smile, type: :model do
  before do
    @smile = FactoryBot.build(:smile)
  end
  describe 'いいね機能' do
    context 'いいねできる場合' do
      it 'postとuserと紐づいていればいいねできる' do
        expect(@smile).to be_valid
      end
    end
    context 'いいねできない場合' do
      it 'userが紐づいていないといいねできない' do
        @smile.user = nil
        @smile.valid?
        expect(@smile.errors.full_messages).to include("User must exist")
      end
      it 'postが紐づいていないといいねできない' do
        @smile.title = nil
        @smile.valid?
        expect(@smile.errors.full_messages).to include("Title must exist")
      end
    end
  end
end
