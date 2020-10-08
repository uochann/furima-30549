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

| Column          | Type     | Options     |
| --------------- | -------- | ----------- |
| nickname        | string   | null: false |
| email           | string   | null: false |
| password        | string   | null: false |
| birthday        | datetime | null: false |
| last_name       | string   | null: false |
| first_name      | string   | null: false |
| last_name_kana  | string   | null: false |
| first_name_kana | string   | null: false |

### Association

- has_many :items
- has_many :buyers



## items テーブル

| Column          | Type       |  Options                       |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| introduction    | text       | null: false                    |
| price           | integer    | null: false                    |
| item_image      | string     | null: false                    |
| item_condition  | integer    | null: false                    |
| category        | integer    | null: false                    |
| postage_type    | integer    | null: false                    |
| preparation_day | integer    | null: false                    |
| prefecture_code | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |
| buyer           | references | null: false, foreign_key: true |

### Association

- has_one :buyer
- belongs_to :user



## buyer テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| items            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :items



## sending_destination テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefecture_code  | integer    | null: false                    |
| city             | string     | null: false                    |
| house_number     | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | unique: true,                  |
| buyer            | references | null: false, foreign_key: true |

#### Association

- belongs_to :buyer
