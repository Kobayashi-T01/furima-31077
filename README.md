# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| nickname           | string              | null: false             |
| email              | string              | null: false,unique: true|
| password           | string              | null: false             |
| first_name         | string              | null: false             |
| family_name        | string              | null: false             |
| first_name_kana    | string              | null: false             |
| family_name_kana   | string              | null: false             |
| birth_day          | date                | null: false             |

### Association
* has_many :items
* has_many :buys


## items table

| Column          | Type                | Options                 |
|-----------------|---------------------|-------------------------|
| name            | string              | null: false             |
| explain         | text                | null: false             |
| category_id     | integer             | null: false             |
| status_id       | integer             | null: false             |
| delivery_fee_id | integer             | null: false             |
| area_id         | integer             | null: false             |
| day_id          | integer             | null: false             |
| price           | integer             | null: false             |
| user            | references          | foreign_key: true       |

### Association
* belongs_to :item
* has_one :buy
* belongs_to_active_hash :category_id
* belongs_to_active_hash :status_id
* belongs_to_active_hash :delivery_fee_id
* belongs_to_active_hash :area_id
* belongs_to_active_hash :day_id



## buys table

| Column          | Type                | Options                 |
|-----------------|---------------------|-------------------------|
| user            | references          | foreign_key: true       |
| item            | references          | foreign_key: true       |

### Association
* belongs_to :user
* belongs_to :item
* has_one :address


## addresses table

| Column         | Type                | Options                 |
|----------------|---------------------|-------------------------|
| post_code      | string              | null: false             |
| prefecture_id  | integer             | null: false             |
| city           | string              | null: false             |
| house_number   | string              | null: false             |
| building_name  | string              |                         |
| phone_number   | string              | null: false             |
| buy            | references          | foreign_key: true       |

### Association
* belongs_to :buy
* belongs_to_active_hash :prefecture_id