# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user_name          | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| profile            | text   |             |
| profile_image_id   | string |             |

### Association

- has_many :posts, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :titles, dependent: :destroy
- has_many :smiles, dependent: :destroy

## posts テーブル

| Column  | Type       | Options     |
| ------- | ---------- | ----------- |
| title   | string     |             |
| user_id | integer    | null: false |
| body    | text       | null: false |
| image_id| string     | null: false |

### Association

- belongs_to :user
- has_many   :likes, dependent: :destroy

## titles テーブル

| Column  | Type       | Options     |
| ------- | ---------- | ----------- |
| user_id | integer    | null: false |
| content | text       | null: false |
| theme_id| string     | null: false |

### Association

- belongs_to :user
- has_many   :likes, dependent: :destroy
- belongs_to_active_hash :theme

## likes テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| post_id | references | null: false, foreign_key: true |

### Association

- belongs_to :post
- belongs_to :user

## smiles テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| post_id | references | null: false, foreign_key: true |

### Association

- belongs_to :post
- belongs_to :user


# 個人制作アプリ C1-GrandPrix  

## 概要
<https://c1-grandprix.herokuapp.com//>

大喜利を投稿してそれを見た他のユーザーが日常の生活にクスッと笑顔を作ることができる

自分のリストをつくって公開することができます。  
今日やること、毎日がんばっていること、行きたいカフェ、または好きな映画……。リストを作ったらカードを追加してリストを完成させましょう。  
誰かのユニークなリストを見つけたら**いいね**を忘れずに！

## テストアカウント

- メールアドレス  
test@test.com

- パスワード  
test111

## 利用方法

- トップページのヘッダーからユーザー新規登録を行う。
- ヘッダーの写真を投稿するから投稿画面に遷移し、画像と一言を入力して投稿することができる。
- ヘッダーの写真一覧から一覧ページに遷移し、他のユーザの投稿でいいなと感じたらスマイルボタンをクリックすることができる。(もう一度クリックすると解除できる)
- ヘッダーのお題一覧から一覧ページに遷移して他のユーザーの投稿でいいなと感じたらスマイルボタンをクリックすることができる。(もう一度クリックすると解除できる) 
- ヘッダーのお題を投稿するから投稿画面に遷移し、お題を選択して一言を入力すると投稿することができる。
- ヘッダーのランキングからランキングページに遷移するとスマイルボタンを多くもらった人の月間ランキングを見ることができる。 
- 月間1位の人がランキングページにあるルーレットを回して当たった人から選択したご褒美を受けることができる。 

##  アプリケーションを作成した背景

前職の同期や後輩に課題をヒアリングし、「交代勤務なので班編成で別の班になると会うことが少なくなって交流が少なくなる」という課題を抱えているとういうことが判明した。そこで、仕事の休憩の合間などに見れてクスッと笑顔になり、繋がれる様なアプリを開発することにした。     

## 洗い出した要件   
  https://docs.google.com/spreadsheets/d/1n0F8sEEN1doCVbNafBaqlr1xWK8o0gurO2UkOND54-Y/edit#gid=982722306    

### 実装した機能についての画像やGIFおよびその説明   

- https://gyazo.com/c02f7a40c2855e8e9f2ee592d8bd15d6  スタートクリックでルーレットが始まり、ストップクリックで停止する    

### 実装予定の機能    

- 現在ルーレットのユーザー名は手入力で撃たないといけないので、登録しているユーザー名から選択できるようにする予定  


### データベース設計

[![Image from Gyazo](https://i.gyazo.com/ab6e1caf04c677d45cad3e646771c6d7.png)](https://gyazo.com/ab6e1caf04c677d45cad3e646771c6d7)

### 画面遷移図  

[![Image from Gyazo](https://i.gyazo.com/2d4de55f3dc7d8fa5654c337779b8a47.png)](https://gyazo.com/2d4de55f3dc7d8fa5654c337779b8a47)

### 開発環境 

- ・フロントエンド: HTML,CSS / JavaScript, JQuery
- バックエンド : Ruby on Rails (ver 6.0.4) 
- インフラ : AWS (S3) , MySQL 
- テスト : RSpec 
- テキストエディタ : Visual Studio 
- Code・タスク管理 : GitHubプロジェクトボード     

### ローカルでの動作方法

-  % git clone https://github.com/katsu0212/c1-grandprix  