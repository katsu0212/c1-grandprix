require 'rails_helper'

RSpec.describe PostsController, type: :request do
  before do
    @post = FactoryBot.create(:post)
  end
  describe "GET #index" do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do 
      get root_path
      expect(response.status).to eq 200
    end
    
  end

  describe "GET #show" do
    it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do 
      get post_path(@post)
      expect(response.status).to eq 200
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みのテキストが存在する' do 
      get post_path(@post)
      expect(response.body).to include(@post.body)
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みの画像が存在する' do 
      get post_path(@post)
      expect(response.body).to include(@post.image_id)
    end
  end
end
