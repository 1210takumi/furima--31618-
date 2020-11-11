# テーブル設計

## users テーブル

| Column               | Type   | Options     |
| -------------------  | ------ | ----------- |
| nickname             | string | null: false |#ニックネーム
| email                | string | null: false |＃メールアドレス
| encrypted_password   | string | null: false |＃パスワード
| last_name            | string | null: false |＃名前（全角）苗字
| first_name| text     | string | null: false |＃名前（全角）名前
| last_name_kana       | string | null: false |＃名前カナ（全角）苗字
| first_name_kana      | string | null: false |＃名前カナ（全角）名前
| birthday             | date   | null: false |＃生年月日

### Association

- has_many :items
- has_many :purchases


## item テーブル

| Column          | Type      | Options                        |
| --------------- | ----------| ------------------------------ |
| title           | string    | null: false                    |＃商品名
| text            | text      | null: false                    |＃商品の説明
| category_id     | integer   | null: false                    |＃カテゴリー
| status_id       | integer   | null: false                    |＃商品の状態
| shipping_id     | integer   | null: false                    |＃配送料の負担
| prefectures_id  | integer   | null: false                    |＃配送もとの地域（都道府県）
| days_id         | integer   | null: false                    |＃発送までの日数
| price           | integer   | null: false                    |＃値段
| user            | references| null: false, foreign_key: true |
### Association
- has_one : purchase
- belongs_to : users

## purchases テーブル

| Column    | Type         | Options                          |
|-----------|--------------| -------------------------------- |
| user      | references   | null: false, foreign_key: true   |
| prototype | references   | null: false, foreign_key: true   |

### Association
- belongs_to : users
- belongs_to : items
- has_one :shipping_address

## shipping_addressesテーブル

| Column          | Type      | Options                        |
| --------------- | ----------| ------------------------------ |
| postal_code     | string    | null: false                    |＃郵便番号　※ハイフンあり
| prefectures_id  | integer   | null: false                    |＃都道府県
| city            | string    | null: false                    |＃市区町村
| address         | string    | null: false                    |＃番地
| building_name   | string    |                                |＃建物名
| phone_number    | string    | null: false                    |＃電話番号　※ハイフンあり
| purchase        | references| null: false, foreign_key: true |

### Association
- belong_to :purchase

