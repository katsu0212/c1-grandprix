require 'rails_helper'

RSpec.describe '投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @title = FactoryBot.build(:title)
  end
  context '新規投稿ができるとき'do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインする
      visit new_user_session_path
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      find('input[name="commit"]').click
      # 新規投稿ページへのボタンがあることを確認する
      expect(page).to have_content('お題で一言')
      # 投稿ページに移動する
      visit new_title_path
      # フォームに情報を入力する
      fill_in 'title[theme_id]', with: @title.theme_id
      fill_in 'title[content]', with: @title.content
      # 投稿するとPostモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { Title.count }.by(1)
     
      # お題の投稿一覧に遷移する
      visit titles_path
      # お題一覧ページには先ほど投稿した内容のツイートが存在することを確認する
      expect(page).to have_content(@title_content)

      
    end
  end
  context '新規投稿ができないとき'do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # 新規投稿ページへのボタンがないことを確認する
      expect(page).to have_no_content('お題で一言')
    end
  end
end
