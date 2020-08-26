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

| Column                   | Type       | Options                        |
| -------------            | ------     | -----------------------------  |
| user                     | references | null: false, foreign_key: true |
| category_id              | string     | null: false                    |
| product_status_id        | string     | null: false                    |
| shipping_charges_id      | string     | null: false                    |
| shipping_region_id       | string     | null: false                    |
| shipping_date_id         | string     | null: false                    |
| item                     | string     | null: false                    |
| image                    | string     | null: false                    |
| price                    | integer    | null: false                    |

### Association
- belongs_to :user
- has_one :purchase
- belongs_to :category
- belongs_to :product_status
- belongs_to :shipping_charges
- belongs_to :shipping_region
- belongs_to :shipping_date 

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
| prefectures_id  | string       | null: false                    |
| city            | string       | null: false                    |
| address         | string       | null: false                    |
| building_name   | string       |                                |
| phone_number    | string       | null: false                    |
| purchase        | references   | null: false, foreign_key: true |

### Association
- belongs_to :purchase
- belongs_to :postcode
- belongs_to :prefectures

## category / ActiveHash テーブル

| Column          | Type     | Options     |
| -------------   | ------   | ----------- |
| category        | string   | null: false |

### Association
- has_many :items

## product_status / ActiveHash テーブル

| Column          | Type     | Options     |
| -------------   | ------   | ----------- |
| product_status  | string   | null: false |

### Association
- has_many :items

## shipping_charges / ActiveHash テーブル

| Column            | Type     | Options     |
| -------------     | ------   | ----------- |
| shipping_charges  | string   | null: false |

### Association
- has_many :items

## shipping_region / ActiveHash テーブル

| Column            | Type     | Options     |
| -------------     | ------   | ----------- |
| shipping_region  | string   | null: false |

### Association
- has_many :items

## shipping_date  / ActiveHash テーブル

| Column            | Type     | Options     |
| -------------     | ------   | ----------- |
| shipping_date     | string   | null: false |

### Association
- has_many :items

