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
- has_many :orders

## items テーブル

| Column                   | Type        | Options                        |
| -------------            | ------      | -----------------------------  |
| user                     | references  | null: false, foreign_key: true |
| category_id              | integer     | null: false                    |
| product_status_id        | integer     | null: false                    |
| shipping_charges_id      | integer     | null: false                    |
| shipping_region_id       | integer     | null: false                    |
| shipping_date_id         | integer     | null: false                    |
| name                     | string      | null: false                    |
| price                    | integer     | null: false                    |
| description              | text        | null: false                    |

### Association
- belongs_to :user
- has_one :order
- has_one_attached :image

## orders テーブル

| Column            | Type       | Options                        |
| -------------     | ------     | -----------------------------  |
| user              | references | null: false, foreign_key: true |
| item              | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column             | Type         | Options                        |
| -------------      | ------       | -----------------------------  |
| postcode_id        | string       | null: false                    |
| shipping_region_id | integer      | null: false                    |
| city               | string       | null: false                    |
| address            | string       | null: false                    |
| building_name      | string       |                                |
| phone_number       | string       | null: false                    |
| order              | references   | null: false, foreign_key: true |

### Association
- belongs_to :order

