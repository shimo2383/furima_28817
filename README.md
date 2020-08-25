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
| birth_day_yy    | integer  | null: false |
| birth_day_mm    | integer  | null: false |
| birth_day_dd    | integer  | null: false |

### Association
- has_many :items
- has_many :purchases

## items テーブル

| Column                   | Type       | Options                        |
| -------------            | ------     | -----------------------------  |
| user_id                  | references | null: false, foreign_key: true |
| category                 | string     | null: false                    |
| product status           | string     | null: false                    |
| shipping charges         | string     | null: false                    |
| shipping region          | string     | null: false                    |
| estimated shipping date  | string     | null: false                    |
| item                     | string     | null: false                    |
| image                    | string     | null: false                    |
| price                    | integer    | null: false                    |

### Association
- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column            | Type       | Options                        |
| -------------     | ------     | -----------------------------  |
| user_id           | references | null: false, foreign_key: true |
| item_id           | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column          | Type         | Options     |
| -------------   | ------       | ----------- |
| postcode        | string       | null: false |
| prefectures     | string       | null: false |
| city            | string       | null: false |
| address         | string       | null: false |
| building name   | string       |             |
| phone number    | string       | null: false |
| purchase_id     | references   | null: false, foreign_key: true |

### Association
- belongs_to :purchase