# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Associations

- has_one :intro
- has_many :notes
- has_many :sns_credentials
- has_many: comments
- has_many :commented_notes, through: :comments, source: :note
- has_many :favorite, dependent: :destroy
- has_many :favorited_notes, through: :favorites, source: :note
- has_many :relationships
- has_many :followings, through: :relationships, source: :follow
- has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
- has_many :followers, through: :reverse_of_relationships, source: :user
- has_many :active_notifications, class_name: "Notification", foreign_key: "visiter_id", dependent: :destroy
- has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy

## intro テーブル

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| first_name | string     |                   |
| last_name  | string     |                   |
| website    | string     |                   |
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

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| follow | references | foreign_key: true |

### Associations

- belongs_to :user
- belongs_to :follow

## favorites テーブル

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
- has_many :comments, dependent: :destroy
- has_many :commented_users, through: :comments, source: :user
- has_many :favorites, dependent: :destroy
- has_many :favorited_users, through: :favorites, source: :user
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

| Column     | Type    | Options                     |
| ---------- | ------- | --------------------------- |
| visiter_id | integer |                             |
| visited_id | integer |                             |
| note_id    | integer |                             |
| comment_id | integer |                             |
| action     | string  |                             |
| checked    | boolean | default: false, null: false |

### Associations

- belongs_to :note, optional: true
- belongs_to :comment, optional: true
- belongs_to :visiter, class_name: 'User', foreign_key: 'visiter_id',optional: true
- belongs_to :visited, class_name: 'User', foreign_key:'visited_id', optional: true
