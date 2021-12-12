# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user_name          | string |             |
| email              | string | null: false |
| encrypted_password | string | null: false |
| profile            | text   |             |
| profile_image_id   | string |             |

### Association

- has_many :posts, dependent: :destroy
- has_many :likes
- attachment :profile_image

## posts テーブル

| Column  | Type       | Options    |
| ------- | ---------- | ---------- |
| content | string     |            |
| user_id | integer    |            |
| body    | text       |            |
| image_id| string     |            |

### Association

- belongs_to :user
- has_many   :likes
- attachment :profile_image

## likes テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| post    | references | null: false, foreign_key: true |

### Association

- belongs_to :post
- belongs_to :user

