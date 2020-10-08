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
| birth_year      | date   | null: false |
| birth_month     | date   | null: false |
| birth_day       | date   | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |

### Association

- has_many :items
- has_many :buyer



## items テーブル

| Column          | Type       |  Options                       |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| introduction    | text       | null: false                    |
| price           | string     | null: false                    |
| item_image      | string     | null: false                    |
| item_condition  | string     | null: false                    |
| category        | string     | null: false                    |
| postage_type    | string     | null: false                    |
| preparation_day | string     | null: false                    |
| prefecture_code | string     | null: false                    |
| user            | references | null: false, foreign_key: true |
| buyer           | references | null: false, foreign_key: true |

### Association

- has_one :buyer
- belongs_to :user



## buyer テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| card_number      | integer    | null: false                    |
| expiration_year  | integer    | null: false                    |
| expiration_month | integer    | null: false                    |
| security_code    | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |
| items            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :items



## sending_destination テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | integer(7) | null: false                    |
| prefecture_code  | integer    | null: false                    |
| city             | string     | null: false                    |
| house_number     | string     | null: false                    |
| building_name    | string     | null: false,                   |
| phone_number     | integer    | unique: true,                  |
| buyer            | references | null: false, foreign_key: true |

#### Association

- belongs_to :buyer
