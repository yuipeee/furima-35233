# テーブル設計

## users テーブル

| Column       | Type     | Options     |
| ------------ | -------- | ----------- |
| nickname     | string   | null: false |
| email        | string   | null: false |
| password     | string   | null: false |
| name         | string   | null: false |
| name_kana    | string   | null: false |
| birthday     | datetime | null: false |

### Association

- has_many :products
- has_many :cards

## produces テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| image         | string     | null: false                    |
| name          | string     | null: false                    |
| description   | text       | null: false                    |
| category      | string     | null: false                    |
| status        | string     | null: false                    |
| shipping_cost | integer    | null: false                    |
| shipping_area | string     | null: false                    |
| shipping_days | integer    | null: false                    |
| price         | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- bas_one    :card

## cards テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| number  | integer    | null: false,                   |
| date    | datetime   | null: false,                   |
| cord    | integer    | null: false,                   |
| user_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- bas_one    :shipping

## shippings テーブル

| Column        | Type     | Options     |
| ------------- | -------- | ----------- |
| post_code     | integer  | null: false |
| prefecture    | string   | null: false |
| city          | string   | null: false |
| address       | integer  | null: false |
| building_name | string   |             |
| phone_number  | integer  | null: false |

### Association

- belongs_to :card