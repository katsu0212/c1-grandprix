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
- attachment :profile_image

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
- attachment :profile_image

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


|  アプリケーション名   | C1 GrandPrix
|  アプリケーション概要 | 大喜利を投稿してそれを見た他のユーザーが日常の生活にクスッと笑顔を作ることができる
|  URL                  |
|  テスト用アカウント   |・メールアドレス:test@test.com
|                       |・パスワード:test111
|  利用方法             | 1.トップページのヘッダーからユーザー新規登録を行う。
|                       | 2.ヘッダーの写真を投稿するから投稿画面に遷移し、画像と一言を入力して投稿することができる。
|                       | 3.ヘッダーの写真一覧から一覧ページに遷移し、他のユーザの投稿でいいなと感じたらスマイルボタンをクリックすることができる。(もう一度クリックすると解除できる)
|                       | 4.ヘッダーのお題一覧から一覧ページに遷移して他のユーザーの投稿でいいなと感じたらスマイルボタンをクリックすることができる。(もう一度クリックすると解除できる)
|                       | 5.ヘッダーのお題を投稿するから投稿画面に遷移し、お題を選択して一言を入力すると投稿することができる。
|                       | 6.ヘッダーのランキングからランキングページに遷移するとスマイルボタンを多くもらった人の月間ランキングを見ることができる。
|                       | 7.月間1位の人がランキングページにあるルーレットを回して当たった人から選択したご褒美を受けることができる。
| アプリケーションを    | 前職の同期や後輩にヒアリングをし、「交代勤務なので班が違うとコミュニケーションを取る機会がない」、という課題を抱えているとういうことが判明した。
|                       | そこで、仕事の休憩の合間などに見れてクスッと笑顔になるようなアプリを開発することにした。
|  作成した背景         |
|  洗い出した要件       | https://docs.google.com/spreadsheets/d/1n0F8sEEN1doCVbNafBaqlr1xWK8o0gurO2UkOND54-Y/edit#gid=982722306
|  実装した機能に       |
|  ついての画像やGIF    |
|  およびその説明       |
|  実装予定の機能       |
|  データベース設計     |
|                       |
|  画面遷移図           |
|                       |
|  開発環境             |
|                       |
|  ローカルでの動作方法 |
|
