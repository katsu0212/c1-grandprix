require 'rails_helper'

RSpec.describe '投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.build(:post)
  end
  context '新規投稿ができるとき'do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインする
      visit new_user_session_path
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      find('input[name="commit"]').click
      # 新規投稿ページへのボタンがあることを確認する
      expect(page).to have_content('New Post')
      # 投稿ページに移動する
      visit new_post_path
      # 添付する画像を定義する
      image_path = Rails.root.join('public/images/test.png')
      # フォームに情報を入力する
      attach_file('post[image]', image_path)
      fill_in 'post[body]', with: @post.body
      # 投稿するとPostモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Post.count }.by(1)
     
      # トップページに遷移する
      visit root_path
      # トップページには先ほど投稿した内容が存在することを確認する（画像）
      expect(page).to have_selector('img')
      # トップページには先ほど投稿した内容のツイートが存在することを確認する（テキスト）
      expect(page).to have_content(@post_text)

      
    end
  end
  context '新規投稿ができないとき'do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # 新規投稿ページへのボタンがないことを確認する
      expect(page).to have_no_content('New Post')
    end
  end
end
