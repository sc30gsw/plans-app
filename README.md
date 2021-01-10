# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Associations

- has_one :intro
- has_many :sns_credentials
- has_many :active_relationships
- has_many :followed_users
- has_many :passive_relationships
- has_many :following_users
- has_many :favorites
- has_many :favorite_notes
- has_many :active_notifications
- has_many :passive_notifications
- has_many :notes
- has_many :comments

## intro テーブル

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| first_name | string     |                   |
| last_name  | string     |                   |
| website    | string     |                   |
| image      | string     |                   |
| profile    | text       |                   |
| user       | references | foreign_key: true |

### Associations

- belongs_to :user

## sns_credentials テーブル

| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| provider | string     |                   |
| uid      | string     |                   |
| user     | references | foreign_key: true |

### Associations

- belongs_to :user

## relationships テーブル

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

## notes テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| title  | string     | null: false       |
| text   | text       | null: false       |
| plan   | text       | null: false       |
| user   | references | foreign_key: true |

### Associations

- has_many :note_tags
- has_many :tags, through: :note_tags
- has_many :comments
- has_many :favorites
- has_many :favorite_users
- has_many :notifications
- belongs_to :user

## tags テーブル

| Column | Type   | Options          |
| ------ | ------ | ---------------- |
| name   | string | uniqueness: true |

### Associations

- has_many :note_tags
- has_many :notes, through: :note_tags

## note_tags テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| note   | references | foreign_key: true |
| tag    | references | foreign_key: true |

### Associations

- belongs_to :note
- belongs_to :tag

## Comments テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| text   | text       | null: false       |
| user   | references | foreign_key: true |
| note   | references | foreign_key: true |

### Associations

- has_many :notifications
- belongs_to :user
- belongs_to :note

## notifications テーブル

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
