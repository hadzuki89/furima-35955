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
- has_many :purchase_records

## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| description        | text   | null: false |
| category           | string | null: false |
| condition          | string | null: false |
| delivery_fee       | string | null: false |
| area               | string | null: false |
| day                | string | null: false |
| price              | string | null: false |
| user               | references | foreign_key: true |

- belongs_to :user
- has_one :purchase_record

## destination テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| postal_code        | string | null: false |
| prefecture         | string | null: false |
| city               | string | null: false |
| house_number       | string | null: false |
| building           | string | null: false |
| number             | string | null: false |
| item               | references | foreign_key: true |
| user               | references | foreign_key: true |

- belongs_to :purchase_record

## purchase_record テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| user               | references | foreign_key: true |
| item               | references | foreign_key: true |

- belongs_to :destination
- belongs_to :user
- belongs_to :item