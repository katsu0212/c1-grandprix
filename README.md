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
| user    | references | null: false, foreign_key: true |
| post    | references | null: false, foreign_key: true |

### Association

- belongs_to :post
- belongs_to :user

## smiles テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| post    | references | null: false, foreign_key: true |

### Association

- belongs_to :post
- belongs_to :user

