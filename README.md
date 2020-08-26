#テーブル設計

## users テーブル

| Column          | Type     | Options     |
| -------------   | ------   | ----------- |
| nickname        | string   | null: false |
| email           | string   | null: false |
| password        | string   | null: false |
| last_name       | string   | null: false |
| first_name      | string   | null: false |
| last_name_kana  | string   | null: false |
| first_name_kana | string   | null: false |
| birth_date      |  date    | null: false |

### Association
- has_many :items
- has_many :purchases

## items テーブル

| Column                   | Type        | Options                        |
| -------------            | ------      | -----------------------------  |
| user                     | references  | null: false, foreign_key: true |
| category_id              | integer     | null: false                    |
| product_status_id        | integer     | null: false                    |
| shipping_charges_id      | integer     | null: false                    |
| shipping_region_id       | integer     | null: false                    |
| shipping_date_id         | integer     | null: false                    |
| item                     | string      | null: false                    |
| image                    | string      | null: false                    |
| price                    | integer     | null: false                    |

### Association
- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column            | Type       | Options                        |
| -------------     | ------     | -----------------------------  |
| user              | references | null: false, foreign_key: true |
| item              | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column          | Type         | Options                        |
| -------------   | ------       | -----------------------------  |
| postcode_id     | string       | null: false                    |
| prefectures_id  | integer      | null: false                    |
| city            | string       | null: false                    |
| address         | string       | null: false                    |
| building_name   | string       |                                |
| phone_number    | string       | null: false                    |
| purchase        | references   | null: false, foreign_key: true |

### Association
- belongs_to :purchase

