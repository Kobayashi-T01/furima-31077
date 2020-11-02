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
| birth_year         | date                | null: false             |
| birth_month        | date                | null: false             |
| birth_day          | date                | null: false             |

### Association
* has_many :items
* has_many :buys


## items table

| Column          | Type                | Options                 |
|-----------------|---------------------|-------------------------|
| item_name       | string              | null: false             |
| item_explain    | text                | null: false             |
| category        | string              | null: false             |
| item_status     | string              | null: false             |
| delivery_fee    | string              | null: false             |
| area            | string              | null: false             |
| day             | string              | null: false             |
| price           | integer             | null: false             |
| user            | references          | foreign_key: true       |

### Association
* belongs_to :items
* has_one :buy


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
| post_code      | integer             | null: false             |
| prefecture     | string              | null: false             |
| city           | string              | null: false             |
| house_number   | string              | null: false             |
| building_name  | string              |                         |
| phone_number   | integer             | null: false             |
| buy            | references          | foreign_key: true       |

### Association
* belongs_to :buy
