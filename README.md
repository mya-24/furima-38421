# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

## User
| Column               | Type       | Options                        |
|----------------------|------------|--------------------------------|
| nickname             | text       | null: false                    |
| email                | text       | null: false, unique: true      |
| encrypted_password   | text       | null: false                    |
### Association 
has_many :items
has_many :delivery_info


## Item
| Column               | Type       | Options                        |
|----------------------|------------|--------------------------------|
| item_name            | text       | null: false, foreign_key: true |
| item_image           | text       | null: false                    |
| description          | string     | null: false                    |
| category             | string     | null: false                    |
| condition            | string     | null: false                    |
| cost_person          | string     | null: false                    |
| from_address         | string     | null: false                    |
| prepare_days         | string     | null: false                    |
| price                | string     | null: false                    |
| seller               | references | null: false, foreign_key: true |
### Association
belongs_to :user
has_one :purchase_log


## Purchase_log
| Column               | Type      | Options                        |
|----------------------|-----------|--------------------------------|
| buyer                | string    | null: false, foreign_key: true |
| item                 | string    | null: false, foreign_key: true |
### Association
has_many :user
has_one :items
has_one :delivery_info


## Delivery_info
| Column               | Type      | Options                        |
|----------------------|-----------|--------------------------------|
| buyer                | string    | null: false, foreign_key: true |
| address_postcode     | string    | null: false                    |
| address_city         | string    | null: false                    |
| address_cho          | string    | null: false                    |
| address_other        | string    | null: false                    |
| address_building     | string    |                                |
| tel_number           | string    | null: false                    |
### Association
has_one :purchase_log
belongs_to :user



* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
