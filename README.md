# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

## Users
| Column               | Type       | Options                        |
|----------------------|------------|--------------------------------|
| nickname             | string     | null: false                    |
| email                | string     | null: false, unique: true      |
| encrypted_password   | string     | null: false                    |
| firstname_kanji      | string     | null: false                    |
| lastname_kanji       | string     | null: false                    |
| firstname_katakana   | string     | null: false                    |
| lastname_katakana    | string     | null: false                    |
| birthday_year        | integer    | null: false                    |
| birthday_month       | integer    | null: false                    |
| birthday_day         | integer    | null: false                    |
### Association 
has_many :items
has_many :delivery_info


## Items
| Column               | Type       | Options                        |
|----------------------|------------|--------------------------------|
| item_name            | string     | null: false                    |
| description          | text       | null: false                    |
| category_id          | integer    | null: false                    |
| condition_id         | integer    | null: false                    |
| cost_person_id       | integer    | null: false                    |
| prefecture_id        | integer    | null: false                    |
| prepare_days_id      | integer    | null: false                    |
| price                | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |
### Association
belongs_to :users
has_one :purchase_logs


## Purchase_logs
| Column               | Type       | Options                        |
|----------------------|------------|--------------------------------|
| user                 | references | null: false, foreign_key: true |
| item                 | references | null: false, foreign_key: true |
### Association
has_many :users
has_one :items
has_one :delivery_info


## Delivery_info
| Column               | Type       | Options                        |
|----------------------|------------|--------------------------------|
| address_postcode     | string     | null: false                    |
| prefecture_id        | integer    | null: false                    |
| address_cho          | string     | null: false                    |
| address_other        | string     | null: false                    |
| address_building     | string     |                                |
| tel_number           | string     | null: false                    |
### Association
has_one :purchase_logs
belongs_to :users



* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
