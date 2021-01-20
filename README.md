# PlansApp

「PlansApp」は、本や論文に関する記事を投稿するだけでなく、どのように日常生活で使っていくのか・使えるのかといったアクションプランまでを投稿し共有する WEb アプリケーションです。

「知識をうまく具体的な行動に移せない」「アクションプランが思いつかない」という方におすすめです。本や論文の要約や解説だけでなく、日常的にどう使うかといったことまでを共有できます。それにより、サービスを利用する人全員が誰かにとって人生を変える Planer になれるサービスです。

# URL

https://www.plans30.com/

- 常時 SSL 化(AWS,ACM,Route53,ALB)
- トップページのヘッダーにゲストログインリンクを設置しております。

# AWS 構成図

![infla](https://user-images.githubusercontent.com/74711118/104869515-93344500-5989-11eb-9741-a41cff8fd5bb.png)

# Web ページサンプル

<img width="1674" alt="plans-top" src="https://user-images.githubusercontent.com/74711118/104876400-f4184900-599a-11eb-80c8-e15c6aa676d3.png">

<img width="1643" alt="plans-show" src="https://user-images.githubusercontent.com/74711118/104876419-faa6c080-599a-11eb-8321-77ff44e9caa1.png">

<img width="1661" alt="plans-myp" src="https://user-images.githubusercontent.com/74711118/104876421-fd091a80-599a-11eb-8ac9-73bf8274644d.png">

<img width="1651" alt="DM" src="https://user-images.githubusercontent.com/74711118/105157872-bf4df280-5b50-11eb-9975-d326c0157509.png">

# 制作背景

現在コロナの自粛期間中でお家で過ごす人が増え読書量が増えている、ということを耳にしました。
私自身も読書が趣味でよく本を読みますが、読んだとしても行動に移せる人がどのくらいるのかと調べたところ 3%くらいの人しか読書などで得た知識を日常の中で活かせていないということを知りました。

そこで、「なぜ行動に移すことができないのか」と考えたところ、「具体的にどう行動したらいいのかがわからない」という人が多いのではと思い、「具体的な行動」という部分に重点を置き、要約や解説だけでなく具体的でわかりやすいアクションプランも共有できるようなサービスがあったらいいのではないかと考え、PlansApp を制作しようと決意しました。

このサービスを通して、より多くの人が日常の中で学んだ知識を活かして、知識だけでなく経験も深めていって人生を変えるような知識に出会えるきかっけにしてほしいと思います。
そのためにアウトプットだけでなく、インプットと行動できるプランというルーブを作れるようにどれだけ学んだかを可視化できるマイページやストレスフリーに使用できるようにアイコンなどを多用し、感覚的に使えるようにしようと思い 1 つ 1 つの機能を実装しました。

# 工夫した点

- 開発環境に Docker と docker-compose を用いて、より実務に近い形で制作を行ったこと
- 本番環境では AWS の EC2 はデプロイし、自動デプロイまで行なったこと
- 自動デプロイ後 CircleCI を導入し Capistrano と CI/CD パイプラインをつないだこと
- 保守性向上のため AWS 各種サービスを利用したこと(EC2,RDS,S3,Route53,ACM,ALB)
- 合計 216 項目のテスト作成
- SNS 認証ログインができるよう Twitter・Facebook の外部 API を利用したこと
- UI/UX にレスポンシブ Web デザインを適用し iphone6(画面幅: 375px まで対応)
- 感覚的に操作ができるようにアイコンを多めに使用したフロント実装
- 学びや行動のモチベーションが上がるように、ユーザーページにアナリティクスを付け進捗などを視覚化したこと
- メモ機能にはアクションプランや学んだことをメモでき、ドッラグ & ドロップすることで行動回数を可視化できるようにしたこと
- メモ機能の既読機能実施後は色を残して、上記のように線が貯まるほど行動していることを可視化してモチベーションにつなげるようにしたこと

# 使用技術

- HTML/CSS
- Bootstrap
- JavaScript/jQuery/Ajax
- Ruby 2.6.5
- Rails 6.0.0
- MySQL 5.6.50
- Linux(各種コマンド操作)
- Nginx(Web Server)
- Unicorn(Application Server)
- Git/GitHub(pull request,Issue 等による擬似チーム開発)
- Docker 20.10.0
- docker-compose 1.27.4
- CircleCI(CI/CD)
- Capistrano
- AWS
  EC2 (Amazon Linux2)/RDS(MariaDB)/S3/VPC/IAM
- AWS(ACM,Route53,ALB)

# 機能一覧

### ユーザー機能

- ユーザー新規登録・ログイン機能(Gem: devise)
- SNS 認証ログイン機能(Twitter/Facebook API/ Gem: omniauth)
- ゲストログイン
- ユーザー情報編集機能(Gem: ActiveStorage)
- ユーザーアイコンプレビュー表示機能
- ユーザー詳細ページ表示機能
- ユーザー週間アナリティクス機能

### 投稿機能

- 新規投稿機能(画像投稿用に Gem: ActiveStorage 使用)
- 投稿一覧表示機能(いいね順・新着順で表示を分けています)
- 投稿詳細表示機能
- 投稿編集機能
- 投稿削除機能
- SNS 共有機能(Twitter/Facebook/LINE)
- ページネーション機能(Gem: kaminari)
- マークダウン形式による投稿・投稿表示(Gem: redcarpet, Gem: coderay)

### タグ付機能

- タグ付け機能(Form オブジェクト)
- タグのインクリメンタルサーチ機能(Ajax/非同期処理)
- タグ一覧表示機能

### コメント機能

- コメント新規投稿機能(画像投稿に Gem: ActiveStorage 使用)
- コメント削除機能
- コメント一覧表示機能

### 検索機能

- キーワード検索機能

### フォロー・フォロワー機能

- フォロー・フォロー解除機能
- フォロー、フォロワー一覧表示機能

### いいね機能

- いいね・いいね解除機能
- いいね一覧表示機能
- いいねしたユーザー一覧表示機能

### 通知機能

- いいね・フォロー・コメントの通知
- 通知一覧表示機能
- 通知削除機能

### DM 機能

- ユーザー間チャット作成機能(相互フォロー同士のみ)
- チャットルーム内メッセージ投稿機能
- チャットルーム削除機能

### メモ機能

- アプリ内メモ機能
- ドラッグ&ドロップ機能(JavaScript)
- メモ既読機能(Ajax/非同期通信)
- メモ一括削除機能

### テスト機能

- RSpec/Rubocop テスト機能
- エラーメッセージの日本語表示
- モデルに対するバリデーション(正規表現)

# 課題、懸念点、今後実装したい機能

- Ajax が不十分なため非同期通信をコメント・いいねなどにも実装する
- 記事投稿プレビュー機能
- 記事カテゴリー選択機能の実装
- タグ検索機能の実装

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
- has_many :entries, dependent: :destroy
- has_many :messages, dependent: :destroy
- has_many :memos

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

## rooms テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |

### Associations

- has_many :entries, dependent: :destroy
- has_many :messages, dependent: :destroy

## entries テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| room   | references | foreign_key: true |

### Associations

- belongs_to :user
- belongs_to :room

## messages テーブル

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| text   | text       | null: false       |
| user   | references | foreign_key: true |
| room   | references | foreign_key: true |

### Associations

- belongs_to :user
- belongs_to :room

## memos テーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| content | text       | null: false       |
| checked | boolean    |                   |
| user    | references | foreign_key: true |

### Associations

- belongs_to :user
