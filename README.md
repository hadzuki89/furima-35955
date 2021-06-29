## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name               | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birth_day          | string | null: false |
| name               | string | null: false |

- has_many :items
- has_many :comments

## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| description        | text   | null: false |
| category           | string | null: false |
| condition          | string | null: false |
| delivery_fee       | string | null: false |
| area               | string | null: false |
| days               | string | null: false |
| price              | string | null: false |
| user_id            | references |

- belongs_to :user
- has_many :comments

## comments テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| comment            | text       | null: false |
| user_id            | references |
| item_id            | references |

- belongs_to :user
- belongs_to :item

## card テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| card               | text       | null: false |
| user_id            | references |

- belongs_to :user