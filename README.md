## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| name               | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birth_day          | date   | null: false |

- has_many :items
- has_many :orders
- has_many :comments

## items テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| name               | string  | null: false |
| description        | text    | null: false |
| category_id        | integer | null: false |
| condition_id       | integer | null: false |
| delivery_fee_id    | integer | null: false |
| area_id            | integer | null: false |
| day_id             | integer | null: false |
| price              | integer | null: false |
| user               | references | foreign_key: true |

- belongs_to :user
- has_one :order
- has_many :comments

## destination テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| postal_code        | string | null: false |
| area_id            | integer | null: false |
| city               | string | null: false |
| house_number       | string | null: false |
| building           | string |
| number             | string | null: false |
| order              | references | foreign_key: true |

- belongs_to :order

## order テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| user               | references | foreign_key: true |
| item               | references | foreign_key: true |
|                | references | foreign_key: true |

- has_one :destination
- belongs_to :user
- belongs_to :item

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | foreign_key: true              |
| item   | references | foreign_key: true              |

- belongs_to :user
- belongs_to :item