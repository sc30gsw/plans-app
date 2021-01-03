# テーブル設計

## usersテーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Associations

- has_many :active_relationships
- has_many :followed_users
- has_many :passive_relationships
- has_many :following_users
- has_many :favorites
- has_many :favorite_notes
- has_many :active_notifications
- has_many :passive_notifications
- has_many :notes
- has_many :plans
- has_many :plan_users
- has_many :comments

## relationshipsテーブル

| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| follower | references | foreign_key: true |
| followed | references | foreign_key: true |

### Associations

- belongs_to :user

## favorites

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| note   | references | foreign_key: true |

- belongs_to :user
- belongs_to :note

## notesテーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| title  | string     | null: false       |
| text   | text       | null: false       |
| user   | references | foreign_key: true |

### Associations

- has_one  :plan
- has_many :comments
- has_many :favorites
- has_many :favorite_users
- has_many :notifications
- belongs_to :user

## plansテーブル

| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| content  | text       | null: false       |
| price    | integer    | null: false       |
| user     | references | foreign_key: true |
| note     | references | foreign_key: true |

### Associations

- has_one :plan_user
- belongs_to :user
- belongs_to :note

## plan_usersテーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| plan   | references | foreign_key: true |
| user   | references | foreign_key: true |

### Associations

- has_one :order-info
- belongs_to :plan
- belongs_to :user

## order_infosテーブル

| Column    | Type       | Options           |
| --------- | ---------- | ----------------- |
| plan_user | references | foreign_key: true |

### Associations

- belongs_to :plan_user

## Commentsテーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| text   | text       | null: false       |
| user   | references | foreign_key: true |
| note   | references | foreign_key: true |

### Associations

- has_many :notifications
- belongs_to :user
- belongs_to :note

## notificationsテーブル

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| visiter_id | integer | null: false |
| visited_id | integer | null: false |
| note_id    | integer |             |
| comment_id | integer |             |
| action     | string  | null: false |
| checked    | boolean | null: false |

### Associations

- belongs_to :note
- belongs_to :comment
- belongs_to :visitor
- belongs_to :visited