# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| birthday        | date   | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |

### Association

- has_many :items
- has_many :buyers



## items テーブル

| Column             | Type       |  Options                       |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| introduction       | text       | null: false                    |
| price              | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| postage_type_id    | integer    | null: false                    |
| preparation_day_id | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- has_one :buyer
- belongs_to :user



## order テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one : sending_destination


## sending_destination テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| house_number     | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | unique: true,                  |
| order            | references | null: false, foreign_key: true |

#### Association

- belongs_to :order
