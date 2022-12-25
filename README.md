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
| nickname             | text       | null: false, unique: true      |
| email                | text       | null: false                    |
| encrypted_password   | text       | null: false                    |
### Association 
has_many :items (user - seller)


## Items
| Column               | Type       | Options                        |
|----------------------|------------|--------------------------------|
| item_name            | text       | null: false                    |
| item_image           | text       | null: false                    |
| description          | string     | null: false                    |
| category             | string     | null: false                    |
| condition            | string     | null: false                    |
| cost_side            | string     | null: false                    |
| from_address         | string     | null: false                    |
| need_days            | string     | null: false                    |
| price                | string     | null: false                    |
| seller               | references | null: false, foreign_key: true |
### Association
belongs_to :items (user - seller)
has_one :buying_log(item_id?)


## Buying_log
| Column               | Type      | Options                        |
|----------------------|-----------|--------------------------------|
| buyer                | string    | null: false, foreign_key: true |
| to_address           | string    |                                |
| seller               | string    | null: false, foreign_key: true |
### Association
has_many :items (user - seller)


## Delivery_Address
| Column               | Type      | Options                        |
|----------------------|-----------|--------------------------------|
| buyer                | string    | null: false, foreign_key: true |
| address              | string    |                                |
| seller               | string    | null: false, foreign_key: true |
### Association
has_many :buying_log (user - seller)



* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
