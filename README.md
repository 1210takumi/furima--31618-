

## users テーブル

| Column               | Type   | Options     |
| -------------------  | ------ | ----------- |
| nickname             | string | null: false |
| email                | string | null: false |
| encrypted_password   | string | null: false |
| last_name            | string | null: false |
| first_name           | string | null: false |
| last_name_kana       | string | null: false |
| first_name_kana      | string | null: false |
| birthday             | date   | null: false |

### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column          | Type      | Options                        |
| --------------- | ----------| ------------------------------ |
| title           | string    | null: false                    |
| text            | text      | null: false                    |
| category_id     | integer   | null: false                    |
| product_id      | integer   | null: false                    |
| shipping_id     | integer   | null: false                    |
| prefectures_id  | integer   | null: false                    |
| days_id         | integer   | null: false                    |
| price           | integer   | null: false                    |
| user            | references| null: false, foreign_key: true |
### Association
- has_one : purchase
- belongs_to : user

## purchases テーブル

| Column    | Type         | Options                          |
|-----------|--------------| -------------------------------- |
| user      | references   | null: false, foreign_key: true   |
| item      | references   | null: false, foreign_key: true   |

### Association
- belongs_to : user
- belongs_to : item
- has_one :shipping_address

## shipping_addressテーブル

| Column          | Type      | Options                        |
| --------------- | ----------| ------------------------------ |
| postal_code     | string    | null: false                    |
| prefectures_id  | integer   | null: false                    |
| city            | string    | null: false                    |
| address         | string    | null: false                    |
| building_name   | string    |                                |
| phone_number    | string    | null: false                    |
| purchase        | references| null: false, foreign_key: true |

### Association
- belong_to :purchase
